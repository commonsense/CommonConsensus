from google.appengine.ext import ndb


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

