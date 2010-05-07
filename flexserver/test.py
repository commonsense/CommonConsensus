import django, os

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')

from server.models import *
answer="there sdfsd fosdf"
try:
  concept2 = Concepts.objects.filter(name = answer)[0]
except IndexError: 
  # if this is a new concept, add it to the Concepts table.
  concept2 = Concepts(name=answer, concept_type=1)# concept type is arbitrary (unused) but cannot be null
  concept2.save()


un = 'test'

# returns the final score at the end of a game round
old_score = Users.objects.get(login=un).score

answer_dict = dict()
current_game = Games.objects.get(id=1) 
current_relations = Relations.objects.filter(left_concept=current_game.concept_id, \
    relation_type=current_game.relation_type_id) 

# populate answer_dict with number of times the relation has appeared
for relation in current_relations:
    answer_string="%s(%s,%s)" %(relation.relation_type.name,\
        relation.left_concept.name.lower(),\
        relation.right_concept.name.lower())
    answer_dict[answer_string]=relation.times
    
# all answers that were inputed by users in this round from the answer table
for answer in Answers.objects.all():
  # Iterate through answers and add to user's score 
  answer.user.score += answer.relation.times
  answer.user.save()

# compute the difference to user's current score
score_diff = Users.objects.get(login=un).score-old_score
# send answers and score difference back
print score_diff

other_concepts = [answer.relation.left_concept.name for answer in Answers.objects.all()]
