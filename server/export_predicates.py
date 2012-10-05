from models import *
from models.online import *
import os

dirname = os.path.dirname( os.path.realpath(__file__))
predicates = ndb.gql("SELECT * FROM Predicate").fetch()
with open('%s/data/predicates.csv' % (dirname,), 'a') as f:
    for pred in predicates:
        arg_and_types = ["%s,%s" % (p[0],p[1]) \
                    for p in zip(pred.arguments, pred.argument_types)]
        line = "%i,%s,%s\n" % (pred.frequency, pred.predicate, ','.join(arg_and_types))
        print line
        f.write("%s" % line)

