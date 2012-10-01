from google.appengine.ext import ndb
from google.appengine.api import memcache
import datetime
import random
import logging
from collections import defaultdict

from .concept import Predicate
from .player import Player
from .question import Question, QuestionTemplate


class GameCreationException(Exception):
    """
    A special exception for when a game is created with a bad concept
    """
    pass

class Answer(ndb.Model):
    """
    Temporary data structure that contains a person's response.
    These are embedded into Game instance.
    """
    answer = ndb.StringProperty(indexed=True)
    player_name = ndb.StringProperty()
    player_key = ndb.KeyProperty(Player, indexed=True)


class Game(ndb.Model):
    """
    Represents an instance of a game.   These can be reused, as long
    as they are reset first
    """

    # class variables
    GAME_DURATION = 35
    ANSWER_DURATION = 11
    GAME_COLORS =[0x3B5959, 0x7F8CF1, 0xF2F2E9, 0xD9C4B8, 0xBF6363, 0x044E7F, 0x75B809, 0x117820, 0xFFE240]

    # model components
    started_at = ndb.DateTimeProperty()
    created_at = ndb.DateTimeProperty(auto_now_add=True)
    question = ndb.KeyProperty(Question)
    question_string = ndb.StringProperty()
    players = ndb.StringProperty(repeated=True)
    answers = ndb.StructuredProperty(Answer, repeated=True)
    background_color = ndb.IntegerProperty()
    times_played = ndb.IntegerProperty(default=0)

    cached_status = ndb.PickleProperty()
    is_dirty = ndb.BooleanProperty(default=False)



    @classmethod
    def generate(cls):
        """
        Generates a new game
        """
        # pick a random question-template
        question_template = QuestionTemplate.get_random()

        # ground it (attempt 5 times)
        question_key = None
        for _ in range(5): 
            try:
                question_key = question_template.ground()
                break
            except GameCreationException:
                logging.info("Trying to ground another question")

        # find it if it exists
        game = Game.query(Game.question==question_key).get()
        if not game:
            question_string = question_key.get().question
            game = Game(question=question_key,
                        question_string=question_string)
            game.put()

        return game

    @classmethod
    def start_new_game(cls):
        """
        Starts a new game
        """
        new_game = cls.generate()
        # reset the game 
        new_game.started_at = datetime.datetime.now()
        new_game.answers = []
        new_game.background_color = random.choice(Game.GAME_COLORS) 
        new_game.cached_status = None
        new_game.is_dirty = False
        new_game.players = []
        new_game.times_played += 1
        new_game.put()
        memcache.set('current_game', new_game)
        return new_game

    def _get_cached_status(self):
        """
        This function computes the score or returns the cache in two ways, depending
        on whether the game is still going on, or if the answers need to be computed
        """
        is_answer_round = Game.GAME_DURATION - self.duration() <= Game.ANSWER_DURATION
        has_updated = False
        if is_answer_round:
            # compute if:  non-answer-round cache, or no cache
            if not (self.cached_status and self.cached_status.has_key('player_scores')):
                """
                Here is where all the results are computed, new concepts are added,
                and new predicates are created
                """
                logging.error("COMPUTING FINAL ANSWERS")
                has_updated = True
                unsaved = []   # new records to create 
                counts = defaultdict(int)
                answers_by_players = defaultdict(list)
                # type of answer
                question = self.question.get()
                qt = question.question_template.get()
                arguments = [a.name for a in ndb.get_multi(question.arguments)]
                argument_types = qt.argument_types
                predicate = qt.predicate_name
                answer_type = question.answer_type

                # counts answers
                for answer in self.answers:
                    # TODO: filter bad concepts (e.g. bad words, single letters)
                    counts[answer.answer] += 1
                    answers_by_players[answer.player_name].append(answer.answer)

                # computes scores for each answer
                scores = {}
                for answer, count in counts.items():
                    scores[answer] = (count-1) * 2
                    # create concept for scores with more than 1 count
                    if count > 1:
                        c = Concept(name=answer)
                        c.add_concept_type(answer_type)
                        unsaved.append(c)
                    p = Predicate.update_or_create(predicate,
                            arguments + [answer],
                            argument_types + [answer_type],
                            count)
                    unsaved.append(p)

                # computes scores for each player    
                player_scores = defaultdict(int)
                for answer in self.answers:
                    player_scores[answer.player_name] += scores[answer.answer]

                # update the players' scores
                for player in player_scores:
                    # find player and add score
                    p = Player.query(Player.username==player).get()
                    p.score += player_scores[player]
                    unsaved.append(p)

                # save all of these
                ndb.put_multi(unsaved)

                # store in cached_status
                self.cached_status = {'player_scores': dict(player_scores),
                                      'counts': dict(counts),
                                      'scores':  scores,
                                      'answers_by_players': dict(answers_by_players)}

        elif self.is_dirty or not self.cached_status:
            # compute game-in-progress status
            has_updated = True
            counts = defaultdict(int)
            answers_by_players = defaultdict(list)
            for answer in self.answers:
                counts[answer.answer] += 1
                answers_by_players[answer.player_name].append(answer.answer)

            # store in cached_status
            self.cached_status = {'counts': dict(counts),
                                  'answers_by_players': dict(answers_by_players)}

        if has_updated:
            # reset dirty flag and save it
            self.is_dirty = False
            self.put()
            memcache.set('current_game', self)

        # ultimately, return status 
        return self.cached_status

    def add_player(self, player_name):
        """
        Ensures that the player is in the game
        """
        if not player_name in self.players:
            self.players.append(player_name)
            self.put()
            memcache.set('current_game', self)

    def status(self, player_name, force_final=False):
        """  
        Personalizes the status for the particular player
        """
        self.add_player(player_name)
        status = self._get_cached_status()
        # personalize 
        if 'scores' in status:
            # this is the answer round
            user_counts = {}
            user_scores = {}
            round_score = 0
            for answer in status['answers_by_players'].get(player_name, []):
                user_counts[answer] = status['counts'][answer]
                user_scores[answer] = status['scores'][answer]
                round_score += status['scores'][answer]

            p = Player.query(Player.username==player_name).get()
            total_score = p.score 
            status['counts'] = user_counts
            status['user_scores'] = user_scores
            status['round_score'] = round_score
            status['total_score'] = total_score 
        else:
            # this is just the regular round
            user_counts = {}
            for answer in status['answers_by_players'].get(player_name, []):
                user_counts[answer] = status['counts'][answer]
            status['counts'] = user_counts

        del status['answers_by_players']
        return status

    def duration(self):
        """
        How long the game has elapsed in seconds
        """
        if self.started_at:
            return (datetime.datetime.now() - self.started_at).seconds
        else:
            return 1000000000000

    def add_answer(self, player_name, player_key, answer):
        """
        Adds an answer as a child to the game instance
        """
        """
        if not self.is_dirty and self.cached_status:
            if answer in self.cached_status['answers_by_players']:
                return
        else:
        """
        for a in self.answers:
            if a.player_key == player_key and a.answer == answer:
                return

        if not player_name in self.players:
            self.players.append(player_name)
        new_answer = Answer(parent=self.key,
                        player_name=player_name,
                        answer=answer,
                        player_key=player_key)
        self.answers.append(new_answer)
        self.is_dirty = True
        self.put()
        memcache.set('current_game', self)
