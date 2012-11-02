import re
import random
import logging
from google.appengine.ext import ndb
from google.appengine.api import memcache
from .concept import Concept

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

    times_used = ndb.IntegerProperty(default=0)
    created_at = ndb.DateTimeProperty(auto_now_add=True)

    @classmethod
    def reset_all_usage_stats(cls):
        """
        Sets all the time_used = 0
        """
        to_update = []
        for q in cls.query().fetch():
            q.times_used=0
            to_update.append(q)
        ndb.put_multi(to_update)
        return True

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
        return len(self.argument_types)+1

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
        """ Populates the question template with concepts of the types and 
        returns the grounded question string along with a list of the concept objects
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

        question = Question.get_or_create(question=grounded_string,
                     question_template=self,
                     arguments=concepts_list,
                     answer_type=self.answer_type)
        return question

    @classmethod
    def get_random(cls):
        """
        Returns random minimally used template
        """
        a = ndb.Key('Game', 'singleton')
        min_used = cls.query(ancestor=a).order(cls.times_used).get().times_used
        templates = cls.query(cls.times_used==min_used,
                ancestor=a).fetch()
        return templates[random.randint(0, len(templates)-1)]



class Question(ndb.Model):
    """
    An instance of a grounded question
    """
    question_template = ndb.KeyProperty(QuestionTemplate)
    question = ndb.StringProperty(required=True)
    arguments = ndb.KeyProperty(repeated=True)
    answer_type = ndb.StringProperty()

    times_used = ndb.IntegerProperty(default=0)

    is_banned = ndb.BooleanProperty(default=False)


    @classmethod
    def get_or_create(cls, question_template, question, arguments, answer_type):
        """
        Retrieves the question or creates a new one
        """
        if len(arguments) > 0:
            q = ndb.gql(""" SELECT * FROM Question 
                            WHERE ANCESTOR IS KEY('Game', 'singleton')
                            AND question_template = :1
                            AND arguments IN :2""", question_template.key, arguments).get()
        else:
            q = ndb.gql(""" SELECT * FROM Question 
                            WHERE ANCESTOR IS KEY('Game', 'singleton')
                            AND question_template = :1""",
                            question_template.key).get()

                        
        if not q:
            q = cls(question_template=question_template.key,
                    question=question,
                    arguments=arguments,
                    answer_type=answer_type)
            q.put()
            return q
        return q

    def __str__(self):
        return self.question
