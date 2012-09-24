from google.appengine.ext import ndb
import re
import random
import logging

class Player(ndb.Model):
    username = ndb.StringProperty(required=True)
    first_name = ndb.StringProperty()
    last_name = ndb.StringProperty()
    email = ndb.StringProperty()
    password = ndb.StringProperty()

    score = ndb.IntegerProperty(default=0)
    last_login = ndb.DateTimeProperty(auto_now=True)

    def to_json(self):
        """
        A dictionary of user parameters
        """
        return {'username': self.username,
                'key': self.key.urlsafe()}


class QuestionTemplate(ndb.Model):
    """
    A question is a string along with a series of parameters that
    specify concept types
    """
    ARG_RE = re.compile("\[(.*?)\]")

    question = ndb.StringProperty(required=True)
    predicate_name = ndb.StringProperty(required=True)
    argument_types  = ndb.StringProperty(repeated=True)
    answer_type = ndb.StringProperty()

    created_at = ndb.DateTimeProperty(auto_now_add=True)

    def extract_arguments(self):
        """
        Extracts the concept types from the arguments
        """
        arguments = []
        for match in QuestionTemplate.ARG_RE.finditer(self.question):
            arguments.append(match.groups()[0])

        return arguments

    def arity(self):
        """
        Returns the arity of the predicate 
        """
        return len(self.argument_types)

    def validate(self):
        """
        Ensures that there are enough arguments for the string
        """
        problems = []
        if "0" in self.predicate_name:
            problems.append("Indexing starts at 1 not 0 for predicate arguments!")


        for i, arg in enumerate(self.arguments):
            arg_string = "[%s]" % (arg)
            if arg_string not in self.question:
                problems.append("%s not in question" % (arg_string))

        return problems


    def ground(self):
        """ Populates the question template with concepts of the types and returns the grounded question string along with a list of the concept objects
        """
        grounded_string = self.question[:]
        concepts_list = []

        for match in QuestionTemplate.ARG_RE.finditer(self.question):
            argument_type = match.groups()[0]
            pattern = match.string[match.start():match.end()]
            argument = Concept.get_random(argument_type)
            concepts_list.append(argument.key)
            argument_value = "<b>%s</b>" % (argument.name,)
            grounded_string = grounded_string.replace(pattern, argument_value, 1) 
        
        question_key = Question.get_or_create(question=grounded_string,
                     question_template=self,
                     arguments=concepts_list,
                     answer_type=self.answer_type)
        return question_key

    @classmethod
    def get_random(cls):
        """
        Returns a random question template
        """
        templates = cls.query().fetch()
        return templates[random.randint(0, len(templates)-1)]

class Question(ndb.Model):
    """
    An instance of a grounded question
    """
    question_template = ndb.KeyProperty(QuestionTemplate)
    question = ndb.StringProperty(required=True)
    arguments = ndb.KeyProperty(repeated=True)
    answer_type = ndb.StringProperty()

    @classmethod
    def get_or_create(cls, question_template, question, arguments, answer_type):
        q = ndb.gql(""" SELECT __key__ FROM Question 
                        WHERE question_template = :1
                        AND arguments IN :2""", question_template.key, arguments).get()
                        
        if not q:
            q = cls(question_template=question_template.key,
                    question=question,
                    arguments=arguments,
                    answer_type=answer_type)
            return q.put()
        return q

    def __str__(self):
        return self.question



class QuestionBlacklist(ndb.Model):
    """
    The questions that users have rejected
    """
    pass


class Concept(ndb.Model):
    """
    A word/phrase representative of a concept
    """
    name = ndb.StringProperty()
    concept_types = ndb.StringProperty(repeated=True)
    created_at = ndb.DateTimeProperty(auto_now_add=True)

    @classmethod
    def get_concept_types(cls):
        """
        Returns all of the concept tags
        """
        concept_types = set()
        for concept in ndb.gql("SELECT concept_types FROM Concept").fetch():
            for ct in concept.concept_types:
                concept_types.add(ct)
        return concept_types

    @classmethod
    def get_random(cls, concept_type):
        """
        Returns a random concept of a particular type
        """
        concepts = cls.query(cls.concept_types==concept_type).fetch()
        return concepts[random.randint(0, len(concepts)-1)]


    def add_concept_type(self, concept_type):
        """
        Adds a concept type
        """
        cleaned = concept_type.strip().lower()
        if cleaned not in self.concept_types:
            self.concept_types.append(cleaned)



class Game(ndb.Model):
    started_at = ndb.DateTimeProperty(auto_now_add=True)
    users_playing = ndb.IntegerProperty(default=0)
    question = ndb.KeyProperty(Question)

    @classmethod
    def generate(cls):
        """
        Generates a new game
        """
        # pick a random question-template
        question_template = QuestionTemplate.get_random()

        # ground it
        question_key = question_template.ground()

        # find it if it exists
        game = Game.query(Game.question==question_key).get()
        if not game:
            game = Game(question=question_key)
            game.put()

        return game
       
    @property
    def question_string(self):
        logging.error("Question String called")
        q = self.question.get()
        return q.question

    def add_answer(self):
        """
        Adds an answer as a child to the game instance
        """
        pass

class Answers(ndb.Model):
    """
    Contains a list of predicates that have been added by users
    """
    pass
