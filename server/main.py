import pickle
import os
import string
import datetime
import random
import cgi
import logging

from webapp2_flask import *
from webapp2_extras import sessions
from webapp2 import Config
from google.appengine.ext import ndb, webapp
from google.appengine.api import users, memcache
from google.appengine.api import channel, mail
from models import *


#==============================================================================
# Configuration
#==============================================================================
config = {}
config['webapp2_extras.sessions'] = { 'secret_key': 'chengchangchengchan' }
config['webapp2_extras.auth'] = { 'user_model': Player}

app= Webapp(debug=True, config=config)
from threading import Thread, Lock
client = memcache.Client()

#==============================================================================
#  Helper functions
#==============================================================================
def get_memcache(key, default=None):
    result = client.get('current_game')
    if result is not None:
        return result
    else:
        return default

#@ndb.transactional
def get_current_game():
    """
    Returns the current game or restarts it
    """
    logging.error("Getting current game")
    game = ndb.Key('Game','singleton').get()
    if not game:
        logging.error("creating game")
        game = Game(key=ndb.Key('Game', 'singleton'))
        game.put()
        game = game.start_new_game()
    elif game.is_banned:
        logging.error("game banned, creating new one")
        game = game.start_new_game()
    elif (game.duration() > game.GAME_DURATION):
        logging.error("resetting game")
        game = game.start_new_game()
    client.set('current_game', game)
    return game

def game_to_object(game):
    timeformat = "%a %b %d %H:%M:%S %Y"
    game_object = {}
    game_object['background_color'] =  game.background_color
    game_object['key'] = game.key.urlsafe()
    game_object['players'] = [str(p) for p in  game.players]
    game_object['server_time'] = datetime.datetime.now().strftime(timeformat)
    game_object['game_start'] = game.started_at.strftime(timeformat)
    game_object['question'] = cgi.escape(game.question_string.encode('ascii', 'ignore'))
    #.replace("<b>","").replace("</b>", "\<\\b\>")

    return game_object

#==============================================================================
#  Admin methods
#==============================================================================
@app.route("/players/")
@app.route("/players")
def top_players(request):
    """
    Shows the top players
    """
    players = Player.query().order(-Player.score).fetch()
    data = {}
    data['players'] = players
    return app.render("top_players.html", request, data)

@app.route("/predicates/")
@app.route("/predicates")
def top_predicates(request):
    """
    Shows the top predicates
    """
    predicates = Predicate.query().order(-Predicate.frequency).fetch()
    data = {}
    data['predicates'] = predicates
    return app.render("predicates.html", request, data)

@app.route("/game/")
@app.route("/game")
def admin_list_games(request):
    """
    Lists all of the games that have been played and their answers
    """
    data = {}
    data['games'] = Game.query().fetch()
    data['current_game'] = get_current_game()
    return app.render("admin_list_games.html", request, data)

@app.route("/game/create", admin=True)
@app.route("/game/create/", admin=True)
def create_game(request):
    """
    Generates a new game
    """
    game = Game.generate()
    return app.redirect("/game")

@app.route("/delete_by_key", methods=["POST"], admin=True)
@app.route("/delete_by_key/", methods=["POST"], admin=True)
def delete_by_key(request):
    """
    Deletes all the keys requested
    """
    logging.error(request.POST)
    keys_to_delete = []
    for key, val in request.POST.items():
        if key == "entry":
            keys_to_delete.append(ndb.Key(urlsafe=val))
    app.add_message("%i elements deleted " % (len(keys_to_delete)))
    ndb.delete_multi(keys_to_delete)
    return app.redirect(request.POST['return'])


@app.route("/concept/", methods=["GET"])
@app.route("/concept", methods=["GET"])
def admin_concepts(request):
    """
    PanIf you wanted to [action] a [device], what is the first thing you would do?el to add and edit concepts, concept types, and relation templates.
    """
    data = {}
    data['concept_types'] = Concept.get_concept_types()
    data['concepts'] = Concept.query().fetch()
    data['question_templates'] = QuestionTemplate.query().fetch()
    return app.render("admin_concepts.html", request, data)

@app.route('/concept/<concept_key:[a-zA-Z0-9-_]{25,100}>/concept_type',methods=['POST'])
@app.route('/concept/<concept_key:[a-zA-Z0-9-_]{25,100}>/concept_type/',methods=['POST'])
def add_concept_type(request, concept_key):
    """
    Adds a type to a concept
    """
    concept = ndb.Key(urlsafe=concept_key).get()
    if concept:
        concept.add_concept_type(request.POST['concept_type'])
        concept.put()
        return "OK"
    else:
        return "Concept Not Found"

@app.route("/concept/", methods=["POST"])
@app.route("/concept", methods=["POST"])
def add_concept(request):
    """
    Adds a concept
    """
    concept_name = request.POST['name'].lower().strip()
    existing = ndb.gql("SELECT * FROM Concept WHERE name = :1", concept_name).get()
    if existing:
        app.add_message("Concept %s already exists." % (concept_name))
    elif len(concept_name) < 2:
        app.add_message("Concept name is invalid.")
    else:
        # add the concept
        new_concept = Concept(name=concept_name)
        new_concept.add_concept_type("concept")
        for key, val in request.POST.items():
            if key == "concept_types":
                new_concept.add_concept_type(val)
        new_concept.put()

    return app.redirect("/concept")

@app.route("/question-template/", methods=["GET"])
@app.route("/question-template", methods=["GET"])
def admin_questions(request):
    """
    Admin page for question templates
    """
    data = {}
    data['concept_types'] = Concept.get_concept_types()
    data['question_templates'] = QuestionTemplate.query().fetch()
    return app.render("admin_questions.html", request, data)

@app.route("/question-template/", methods=["POST"])
@app.route("/question-template", methods=["POST"])
def add_question_template(request):
    """
    Method to add a question template
    """
    question = request.POST['question'].strip()
    answer_type = request.POST['answer_type']
    predicate_name = request.POST['predicate']
    concept_types = Concept.get_concept_types()

    qt = QuestionTemplate(question=question,
                          predicate_name=predicate_name,
                          answer_type=answer_type)
    argument_types  = qt.extract_arguments()
    qt.argument_types = argument_types  # store arguments

    bad_concept_types = []

    for argument_type in argument_types:
        if argument_type not in concept_types:
            bad_concept_types.append(argument_type)
    if answer_type not in concept_types:
        bad_concept_types.append(answer_type)

    # validate the question template
    if len(question) < 5:
        app.add_message("Invalid question string", 'error')
    elif len(argument_types) < 1:
        app.add_message("Question has no arguments.", 'error')
    elif answer_type is None:
        app.add_message("No answer concept type specified", 'error')
    elif QuestionTemplate.query().filter(QuestionTemplate.question==question).get():
        app.add_message("Question already exists", 'error')
    elif len(bad_concept_types) > 0:
        app.add_message("Concept type(s) were invalid: %s" % \
                ', '.join(bad_concept_types), 'error')

    else:
        key = qt.put()
        app.add_message("Question %s added!" % key)

    return app.redirect("/question-template")

#==============================================================================
#  Game Methods
#==============================================================================
@app.route("/flexserver/process_answer")
@app.route("/flexserver/process_answer/")
def add_new_answer(request):
    """
    Adds a users' answer to the game
    
    Ancestor path:  game -> user -> answer
    """
    answer = request.POST['answer'].strip().lower()
    user_key = ndb.Key(urlsafe=request.POST['user_key'])
    player_name = request.POST['username']
    game_key = ndb.Key(urlsafe=request.POST['game_key'])
    game = game_key.get()
    current_game = get_current_game()

    if current_game.key != game_key:
        logging.info("Mismatching game keys: old(%s) current(%s)" %\
                (str(game_key), str(current_game.key)))
        return app.render_json({'user': {'username': player_name,
                                         'key': 'undefined'},
                                'game': game_to_object(get_current_game())})
    game.add_answer(player_name=player_name, player_key=user_key, answer=answer)

    is_updated, data = game.status(player_name)
    if is_updated:
        game.put()

    data.update({'game': game_to_object(game)})
    return app.render_json(data)


@app.route("/flexserver/flagquestion")
@app.route("/flexserver/flagquestion/")
def flag_question(request):
    """
    The request method when a player flags a question as 'nonsensical'

    Questions that are flagged enough are added to the black list

    """
    username = request.POST['username']
    game_key = request.POST.get('game_key', None)
    if not game_key:
        logging.error("No Game Key in Request"+str(request.POST))
        return app.redirect("/flexserver/checkup")

    game = ndb.Key(urlsafe=game_key).get()
    problem_type = int(request.POST['problem_type'])
    if game.flag(problem_type):  # flag game
        # changed
        game.put()

    return app.redirect("/flexserver/checkup")


@app.route("/flexserver/finalscore")
@app.route("/flexserver/finalscore/")
def compute_final_score(request):
    """
    Returns the resulting score for all players
    """
    # get the current game

    game_key = ndb.Key(urlsafe=request.POST['game_key'])
    game = game_key.get()
    current_game = get_current_game()
    player_name = request.POST['username']
    if game.key != current_game.key:
        logging.info("Mismatching game keys: old(%s) current(%s)" %\
                (str(game_key), str(current_game.key)))
        return app.render_json({'user': {'username': player_name,
                                         'key': 'undefined'},
                                'game': game_to_object(get_current_game())})


    is_updated, data = game.status(player_name, True)
    if is_updated:
        game.put()
    data.update({'game': game_to_object(game)})
    return app.render_json(data)


@app.route("/flexserver/checkup")
@app.route("/flexserver/checkup/")
def checkup_game_status(request):
    """
    Flash clients call this function every 3 seconds 
    
    This returns details of the game back 
    """

    game_key = ndb.Key(urlsafe=request.POST['game_key'])
    player_name = request.POST['username']
    current_game = get_current_game()
    game = game_key.get()
    game.add_player(player_name)

    # TODO: check mismatching game keys
    if game.key != current_game.key:
        logging.info("Mismatching game keys: old(%s) current(%s)" % \
                (str(game_key), str(current_game.key)))
        return app.render_json({'user': {'username': player_name,
                                         'key': 'undefined'},
                                'game': game_to_object(get_current_game())})

    is_updated, data = game.status(player_name)
    if is_updated:
        game.put()
    data.update({'game': game_to_object(game)})
    return app.render_json(data)


@app.route("/flexserver/users/", methods=["POST"])
def create_user_account(request):
    """
    Create the user's account
    """
    existing_player = Player.query(Player.username==request.POST['login']).get()
    if not existing_player:
        # if the user name is unique
        player = Player(username=request.POST['login'],
                        password=request.POST['password'])
        #                email=request.POST['email'],
        #                first_name=request.POST['first_name'],
        #                last_name=request.POST['last_name'])
        player.put()
        return app.render_json({'user': player.to_json(),
                                'game': game_to_object(get_current_game())})
    else:
        return app.render_json({'error': "User name already exists"})


@app.route("/flexserver/login")
@app.route("/flexserver/login/")
def login_route(request):
    """
    Takes login request and responds with a JSON object
    """
    username = request.POST['login']
    password = request.POST['password']

    player = Player.query(Player.username==username).get()
    
    if player:
        if player.password == password:
            # login successful
            return app.render_json({'user': player.to_json(),
                                    'game': game_to_object(get_current_game())})
        else:
            return app.render_json({"error": "Bad password"})
    else:
        return app.render_json({"error": "No player with username '%s' could be found." % (username)})

#==============================================================================
#  Main UI Routes 
#==============================================================================
@app.route('/')
def game_page(request):
    """
    Shows the game
    """
    return app.render("game.html", request, {})

def main():
    #from google.appengine.ext.webapp import util
    run_wsgi_app(app)

if __name__ == '__main__':
    main()
