from models import * 
from django.http import HttpResponse
from django.core import serializers
from django.contrib.auth.models import User
from django.contrib.auth import * 
from django.shortcuts import render_to_response
import json
#import simplejson as json  # replace previous line with this for users of python < 2.6
import datetime
from collections import defaultdict

GAME_DURATION = 25  # seconds

def continue_game():
    # returns a game from the game table
    game=Games.objects.all()[0]
    # takes a game, returns a json format string
    # with a well formed question.
    questions=game.relation_type.template.replace("%","%s")
    questions=questions %game.concept.name
    d=dict(concept_id=int(game.concept_id),
           now=datetime.datetime.now().isoformat(),
           start=game.last_game.isoformat(),
           question=questions,
           concept=game.concept.name,
           relation_type_id=int(game.relation_type_id))
    return json.dumps(d)

def final_response(sdict,pts):
    #import pdb; pdb.set_trace() # for debuggin purposes
    #takes a dictionary, and an integer
    # returns a dict containing, score, as described above, and a game
    ans_list=[]
    for key in sdict:
        if key!="people playing":
            ans_list.append(dict(score=sdict[key], answer=key.split(',')[1].split(')')[0]))    
    score=dict(top_users=json.dumps([dict(login=u.username,score=u.score) for u in AuthUser.objects.exclude(user__id=1).order_by('score').reverse()[0:10]]),
           points=pts,
           other_users=Games.objects.all()[0].users_playing,
           all_answers=json.dumps(ans_list))
    return dict(score=score, game=continue_game())

def game(request):
  """ this requests the index.html file containing the static SWF file.  It's the only 
  view that is directly called by the user""" 
  return render_to_response('index.html', {})

def user_login(request):
  """ Takes a login request ressponds with user and game data as a JSON object"""
  user_login = unicode(request.POST[unicode('login')])
  password = unicode(request.POST[unicode('password')])
  # use django to authenticate the user, more users have to be added with
  # same names as the ones in the games table, currently, only jacob and test
  # are the users in both tables
  user = authenticate(username=user_login, password=password)
  if user is not None:
    # login the user if they are active 
    if user.is_active:
      login(request,user)
      # retrieve current game from global game record, stored in Games, where ID = 1 
      current_game = Games.objects.get(id=1)
      if (datetime.datetime.now()-current_game.last_game).seconds > GAME_DURATION:
        # start new game
        start_new_game()
        response=json.dumps({'user':{'username':user.username, 'id':user.id},'game':continue_game()})
      else:
        # game is still going
        response=json.dumps({'user':{'username':user.username, 'id':user.id},'game':continue_game()})
      return HttpResponse(response)
    else:
      print "user account has been disabled!"
      return HttpResponse("badlogin")
  else:
    print "user username and password were incorrect."
    return HttpResponse("badlogin")
            

def compute_final_score(request):
  """ This view is called by the client at the end of the game round. Given
  a parameter, request.user, it computes the answers for that user and
  returns the score difference and a dictionary object (an associative
  array, called and object in Flex) of answers, in JSON format."""

  # returns the final score at the end of a game round
  user =  AuthUser.objects.get(username=request.user.username)
  old_score = user.score
  current_game = Games.objects.get(id=1) 
  user_answers = [c.relation.right_concept.name for c in Answers.objects.filter(user=user)]
  # populate answer_dict with number of times the relation has appeared
  answer_dict = defaultdict(int)
  print user_answers 
  for answer in Answers.objects.all():
      answer_string="%s(%s,%s)" %(answer.relation.relation_type.name,\
          answer.relation.left_concept.name.lower(),\
          answer.relation.right_concept.name.lower())
      answer_dict[answer_string] += 1
      # if this is the user's answer add to user's score 
      if answer.relation.right_concept.name in user_answers and answer.user != user:
        user.score += answer.relation.times
  user.save()

  # compute the difference to user's current score
  score_diff = user.score-old_score
  # send answers and score difference back
  response=json.dumps(final_response(dict(answer_dict),score_diff))
  return HttpResponse(response)

def process_answer(request):
  """ This method is given a request object that contains: answer, user_id, relation_type_id and concept_id.
  It then adds this to the answers table (if it does not already exists) and computes a score for the user. 
  """
  #import pdb; pdb.set_trace() # for debuggin purposes
  # uncommenting the above import will allow you to 'step through' each operation when this method is called
  # by typing 'n' into the terminal (you can then repeat last command by typing Return)

  # process HTTP request 
  user_answer=request.POST[unicode('answer')].lower().strip()
  relation_type_id=request.POST[unicode('relation_type_id')]
  concept_id=request.POST[unicode('concept_id')]
  # get a list of people playing 
  people =set([r.user.username for r in Answers.objects.exclude(user__id=1)])
  
  # get all the components for a new relation
  relation_type = RelationTypes.objects.filter(id=int(relation_type_id))
  concept1 = Concepts.objects.get(id=concept_id)  # this is the concept that is already in the game
  try:
    # retrieve concept if it exists in the database
    concept2 = Concepts.objects.filter(name = user_answer)[0]
  except IndexError:
    # COMMONSENSE REASONING CLASS: This is where you need to edit. 
    other_concepts = [answer.relation.right_concept.name for answer in Answers.objects.all()] 
    print "Other concepts", other_concepts
    # compare these with 'user_answer' variable
    # if this is a new concept, add it to the Concepts table.
    concept2 = Concepts(name=user_answer, concept_type=1) # concept type is not being used ATM but cannot be null
    concept2.save()
  # get a list of records in Relations table that match our concept1 AND concept2 AND relation_type
  relations = Relations.objects.filter(left_concept= concept1, right_concept= concept2, relation_type= relation_type)
  add_answer = True 
  # either retrieve an old relation/answer or add new ones
  try:
    # a relation record exists, could be from the same user 
    new_relation = relations[0]
    # make suer it is not from already from same user 
    if len(Answers.objects.filter(user=request.user, relation=new_relation)):
      add_answer = False 
  except IndexError:
    #relation  does not exist in the database, create it
    new_relation = Relations(left_concept_id=concept1.id, right_concept_id=concept2.id, relation_type_id=int(relation_type_id), times=1)
    new_relation.save()
  
  if add_answer:
    # this is a new answer.  add it 
    new_answer = Answers(user_id=request.user.id, relation_id=new_relation.id, created_at=datetime.datetime.now(), updated_at=datetime.datetime.now())
    new_answer.save()
    # update the list of people on the game (TODO: this is done too often)
    current_game =Games.objects.filter(id=1)[0]
    current_game.users_playing=len(people)
    current_game.save()

  answer_dict={}
  # these numbers go along side the user's entry
  # TODO: this should only be done in "single-player" mode! 
  for answer in Answers.objects.filter(user=request.user):
      answer_string="%s(%s,%s)" %(answer.relation.relation_type.name.strip().lower(),
                                  answer.relation.left_concept.name.strip().lower(),
                                  answer.relation.right_concept.name.strip().lower())
      answer_dict[answer_string]=answer.relation.times
  #print "answer dict in relations: " , answer_dict
  
  score=[]
  for key in answer_dict.keys():
          score.append(dict(answer=key, score=answer_dict[key]))

  response=dict(scores=score,people_playing=", ".join(people))
  response=json.dumps(response)
  return HttpResponse(response)


def create_account(request):
  #import pdb; pdb.set_trace() # for debuggin purposes
  try:
    # TODO: checking account uniqueness, more descriptive errors
    user = User.objects.create_user(request.POST['login'], request.POST['email'], request.POST['password'])
    user.first_name = request.POST['first_name'] 
    user.last_name = request.POST['last_name'] 
    user.is_staff = False
    user.save()
  except:
    return HttpResponse("error")
  return_data={'user':{'username':user.username, 'id':user.id},'game':continue_game()}
  return HttpResponse(json.dumps(return_data))

def flagquestion(request,flag_type=1):
    #Takes a request for flagging a question
    #calls for a new game to be started
    # old question is added to the bads table
    
    game=Games.objects.all()[0]
    #print request.POST
    starting_time=request.POST["game_started"]
    flag_type=int(request.POST["problem_type"])
    #print starting_time
    #print flag_type
    last_game=unicode(game.last_game.isoformat())
    #print starting_time==last_game
    if starting_time == last_game:
        if flag_type == 1:
            game.voted_bad += 1
            #print "voted bad"
        else: 
            game.voted_irrelevant += 1
            #print "voted irrelevant"
        game.save()

    game=Games.objects.all()[0]
    if ((game.voted_bad+game.voted_irrelevant)/(game.users_playing+1) >= 0.5):
        b=Bads(concept_id=game.concept.id,
               relation_type_id=game.relation_type.id,
               bad_type=int(game.voted_bad>game.voted_irrelevant),)
        b.save()
        start_new_game()
        
    score=dict(scores=[],people_playing="")
    response=dict(score=score,game=continue_game())
    response=json.dumps(response)
    #print "Response in flagquestion: ", response
    return HttpResponse(response)


def checkup(request=0):
    #import pdb; pdb.set_trace() # for debuggin purposes
    # Clients call on this function every three seconds and the details
    # of the game are submitted back to the clients from this function
    # print "checkup request" , request
    username=request.user.username
    answer_dict={}
    answers=Answers.objects.filter(user=request.user)
    for answer in answers:
        answer_string="%s(%s,%s)" %(answer.relation.relation_type.name.strip().lower(),
                                    answer.relation.left_concept.name.strip().lower(),
                                    answer.relation.right_concept.name.strip().lower())
        #print username," : ", answer_string
        answer_dict[answer_string]=answer.relation.times

    game=Games.objects.all()[0]
    relation_type_id=game.relation_type_id
    concept_id=game.concept.id
    rel=Relations.objects.filter(left_concept=concept_id, relation_type=relation_type_id)
    
    for relation in rel:
        answer_string="%s(%s,%s)" %(relation.relation_type.name.strip().lower(),
                                    relation.left_concept.name.strip().lower(),
                                    relation.right_concept.name.strip().lower())
    if (datetime.datetime.now()-Games.objects.all()[0].last_game).seconds>25:
      #print "Starting new game", (datetime.datetime.now()-Games.objects.all()[0].last_game).seconds
      start_new_game()
    answers = Answers.objects.exclude(user__id=1)
    if len(answers) > 0:
      pp = ", ".join(set([a.user.username for a in answers]))
    else:
      pp = username
    s=[]
    for key in answer_dict.keys():
            s.append(dict(answer=key, score=answer_dict[key]))
    score=dict(scores=s,people_playing=pp)
    response=dict(score=score,game=continue_game())
    response=json.dumps(response)
    return HttpResponse(response)


def new_game_query():
    sql = '''select concepts.id as cid, relation_types.id as rid from (concepts, relation_types)
    LEFT JOIN bads ON (bads.concept_id = concepts.id and bads.relation_type_id = relation_types.id)
    LEFT JOIN relations ON (bads.concept_id = relations.left_concept_id and relations.relation_type_id = relation_types.id)
    WHERE bads.concept_id IS NULL
    AND relations.left_concept_id IS NULL
    ORDER BY Random()
    LIMIT 1'''
    from django.db import connection,transaction
    cursor =connection.cursor()
    cursor.execute(sql)
    row=cursor.fetchone()
    cid,rid=row[0],row[1]
    concept=Concepts.objects.get(id=cid)
    relation_type=RelationTypes.objects.get(id=rid)
    return [concept,relation_type]

def singleplayer_new_game_query():
    #import pdb; pdb.set_trace() # for debuggin purposes
    sql="""select r.left_concept_id as cid, r.relation_type_id as rid  from relations r
    LEFT JOIN bads ON (bads.concept_id = r.right_concept_id and bads.relation_type_id = r.relation_type_id)
    LEFT JOIN relations ON (relations.right_concept_id = r.right_concept_id and relations.relation_type_id = r.relation_type_id)
    WHERE bads.concept_id IS NULL
    AND relations.left_concept_id IS NOT NULL
    ORDER BY Random()
    LIMIT 1"""
    #in postgres: Random() =>  RAND()
    from django.db import connection,transaction
    cursor =connection.cursor()
    cursor.execute(sql)
    row=cursor.fetchone()
    cid,rid=row[0],row[1]
    concept=Concepts.objects.get(id=cid)
    relation_type=RelationTypes.objects.get(id=rid)
    # add existing answers to answers
    current_relations = Relations.objects.filter(left_concept=cid, relation_type=rid) 
    for rel in current_relations:
      new_answer = Answers(user_id=1, relation=rel,\
          created_at=datetime.datetime.now(), updated_at=datetime.datetime.now())
      new_answer.save() 
    return [concept,relation_type]

def start_new_game():
    # Starts a new game,
    # New game is either multiplayer or single player depending on
    # the previous game.
    # delete old answers 
    Answers.objects.all().delete()
    # update 
    total_players=set([a.user.username for a in Answers.objects.all()[:]])
    if len(total_players)>1:
        print " multiplayer game"
        cr=new_game_query()
    else:
        print "single Player game"
        cr=singleplayer_new_game_query()
        #cr=new_game_query()

    concept=cr[0]
    relation_type=cr[1]
    
    g=Games(concept=concept,
            relation_type=relation_type,
            updated_at=datetime.datetime.now(),
            created_at=datetime.datetime.now(),
            last_game=datetime.datetime.now(),
            users_playing=0,
            voted_bad=0,
            voted_irrelevant=0, id=1)
    #print g.concept, g.relation_type
    g.save()

