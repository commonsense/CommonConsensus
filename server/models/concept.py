from google.appengine.ext import ndb
from google.appengine.api import memcache
import logging
import datetime
from collections import defaultdict

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
        if len(concepts) == 0:
            msg = "ConceptType %s has no members" % (concept_type)
            logging.error(msg)
            raise GameCreationException(msg)
        return concepts[random.randint(0, len(concepts)-1)]


    def add_concept_type(self, concept_type):
        """
        Adds a concept type
        """
        cleaned = concept_type.strip().lower()
        if cleaned not in self.concept_types:
            self.concept_types.append(cleaned)
