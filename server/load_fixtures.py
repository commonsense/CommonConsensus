from models.offline import *

from models import *
dirname = os.path.dirname( os.path.realpath(__file__))

ndb.delete_multi(ndb.gql("SELECT __key__ FROM Game").fetch())
ndb.delete_multi(ndb.gql("SELECT __key__ FROM Predicate").fetch())
ndb.delete_multi(ndb.gql("SELECT __key__ FROM Question").fetch())
ndb.delete_multi(ndb.gql("SELECT __key__ FROM QuestionTemplate").fetch())
ndb.delete_multi(ndb.gql("SELECT __key__ FROM Concept").fetch())
ndb.delete_multi(ndb.gql("SELECT __key__ FROM Answer").fetch())
ndb.delete_multi(ndb.gql("SELECT __key__ FROM Player").fetch())

# load concepts
to_add = list()
with open('%s/data/concepts.csv' % (dirname,), 'r') as f:
    f.next()  # skip header
    for line in f:
        line = line.replace('"', '').strip()
        items = line.split(",")
        concept, concept_types = items[0], items[1:]
        c = Concept(name=concept)
        c.add_concept_type("concept")
        for ct in concept_types:
            c.add_concept_type(ct)
        to_add.append(c)
n_concepts = len(to_add)
print "%i concepts loaded " % (n_concepts)


with open('%s/data/question_templates.csv' % (dirname,), 'r') as f:
    f.next()  # skip header
    for line in f:
        question, answer_type = line.strip().split(",")
        
        qt = QuestionTemplate(question=question,
                              answer_type=answer_type)
        argument_types  = qt.extract_arguments()
        predicate_name = "_".join(argument_types + [answer_type]).replace(" ", "")

        qt.predicate_name = predicate_name
        qt.argument_types = argument_types  # store arguments
        to_add.append(qt)

print "%i questions loaded " % (len(to_add)-n_concepts)

# add user
u = Player(username='test', password='test')
to_add.append(u)
# save to db
ndb.put_multi(to_add)
