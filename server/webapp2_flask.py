"""
A small wrapper for webapp that makes a flask-like routing decorator

Based on:
 http://webapp-improved.appspot.com/guide/handlers.html#a-micro-framework-based-on-webapp2

"""
import webapp2
from google.appengine.ext.webapp import util
from google.appengine.api import users, memcache

from webapp2_extras import sessions, jinja2, auth
from webapp2_extras.auth import InvalidAuthIdError
from webapp2_extras.auth import InvalidPasswordError
import tags
import logging

try:
    import json as simplejson
except ImportError:
    from django.utils import simplejson

class Webapp(webapp2.WSGIApplication):

    def __init__(self, *args, **kwargs):
        super(Webapp, self).__init__(*args, **kwargs)
        self.router.set_dispatcher(self.__class__.custom_dispatcher)

    @staticmethod
    def custom_dispatcher(router, request, response):
        rv = router.default_dispatcher(request, response)
        router.session_store = sessions.get_store(request=request)
        if isinstance(rv, basestring):
            rv = webapp2.Response(rv)
        elif isinstance(rv, tuple):
            rv = webapp2.Response(*rv)
        router.session_store.save_sessions(rv)
        return rv


    def route(self, *args, **kwargs):
        """ Defines the decorator for Flask-like route definitions """
        if 'admin' in kwargs and kwargs['admin']:
            # require the user be logged in
            del kwargs['admin']
            # kwargs get passed to route initializer below.  remove 'admin'
            # so it doesn't choke
            def admin_wrapper(func):
                def check_admin_before(request,  *args, **kwargs):
                    if not users.get_current_user():
                        try:
                            webapp2.redirect(users.create_login_url(request.uri).replace("use_json","x"), abort=True)
                        except (AttributeError, KeyError), e:
                            webapp2.abort(403)
                    elif not users.is_current_user_admin():
                        webapp2.abort(403)
                    else:
                        return func(request, *args, **kwargs)
                self.router.add(webapp2.Route(handler=check_admin_before, name=func.__name__, *args, **kwargs))
                # it doesn't appear to matter what is returned here
                return check_admin_before
            return admin_wrapper
        elif 'login' in kwargs and kwargs['login']:
            # require the user be logged in
            del kwargs['login']
            # kwargs get passed to route initializer below.  remove 'login'
            # so it doesn't choke
            def login_wrapper(func):
                def check_login_before(request,  *args, **kwargs):
                    if not users.get_current_user():
                        # If handler has no login_url specified invoke a 403 error
                        try:
                            webapp2.redirect(users.create_login_url(request.uri).replace("use_json","x"), abort=True)
                        except (AttributeError, KeyError), e:
                            webapp2.abort(403)
                    elif kwargs.get('', False) and not users.is_current_user_admin():
                        webapp.abort(403)
                    else:
                        return func(request, *args, **kwargs)
                self.router.add(webapp2.Route(handler=check_login_before, name=func.__name__, *args, **kwargs))
                # it doesn't appear to matter what is returned here
                return check_login_before 
            return login_wrapper
        else:
            def wrapper(func):
                self.router.add(webapp2.Route(handler=func, name=func.__name__, *args, **kwargs))
                #setattr(func, 'handler', '5')
                return func
            return wrapper



    def jinja2_factory(self, app):
        """
        Adds on additional template filters, from templatetags/jinja_tags.py
        Reference: 
         [1] http://webapp-improved.appspot.com/todo.html?highlight=jinja2%20filter#jinja2-factory
         [2] http://webapp-improved.appspot.com/api/webapp2_extras/jinja2.html?highlight=jinja2%20filter#webapp2_extras.jinja2.Jinja2
        """

        j = jinja2.Jinja2(app)
        j.environment.filters.update({
            'active': tags.active,
            'naturaltime': tags.naturaltime,
            'timeuntil': tags.timeuntil,
            'timesince': tags.timesince,
            'datetimeformat': tags.datetimeformat,
            'sourcecode': tags.sourcecode,
            'currency': tags.currency,
        })
        return j

    @webapp2.cached_property
    def jinja2(self):
        # Returns a Jinja2 renderer cached in the app registry.
        return jinja2.get_jinja2(factory=self.jinja2_factory)

    def session_store(self):
        return sessions.get_store(request=self.request)

    def session(self):
        # Returns a session using the default cookie key.
        return self.session_store().get_session()

    def add_message(self, message, level='warning'):
        """ Helper method to include a message in the alert stack.

        Arguments:
        message -- The contents of the message to display to the user.
        level -- The level of severity of the message, from the possible values of
            'info', 'success', 'warning', or 'error'.  Default is a warning.

        See http://twitter.github.com/bootstrap/#alerts for more info.
        """
        session = self.session()
        if 'messages' in session:
            if (message, level) not in session['messages']:
                # avoid duplicates
                session['messages'].append((message, level))
        else:
            session['messages'] = [(message, level)]


    def get_messages(self):
        return self.session().pop('messages', [])

    #-----------------------------------------------------------------------------
    # Rendering and Redirection Methods
    #-----------------------------------------------------------------------------
    def redirect_with_msg(self, msg, destination='/', level='warning'):
        """ Sends the user to another route and includes a message to
        flash/alert on the page when they arrive there.

        The template code responsible for presenting alert messages can be
        found in `/templates/base.html`.

        Arguments:
        msg -- message string that gets output to the user
        destination -- string containing route 
            that to redirect the user to.  Default value is "/"
        level -- status level for the alert message.  Default value is
            "warning"; other possible values are 'success', 'error', and
            'info'.

        For more information, see http://twitter.github.com/bootstrap/#alerts
        """
        self.add_message(msg, level)
        return webapp2.redirect(destination)
  
    def redirect(self,destination='/'):
        """ Redirects the user to a route.

        Arguments:
        destination -- The route to redirect the response handler.  Default value is '/'
        """
        return webapp2.redirect(destination)

    def render_json(self, json_data):
        """ Renders a dictionary as JSON string.
      
        Arguments:
        json_data -- resulting data that needs to be converted into a JSON string.
            Should be a `dict`.  If it is a string, the string itself is
            assumed to be a JSON string and is returned directly.
        """
        if not isinstance(json_data,(str,unicode)):
            json_data = simplejson.dumps(json_data)
        return webapp2.Response(json_data, content_type='application/json', charset='utf-8')

    def render(self, template,  request, context=None):
        """ Default rendering method.  Renders a Jinja2 Template and attaches a
        context to it as well.

        This method is called by any template that is returned from a user/top-level
        HTTP request (not-JSON or redirect).

        This adds some default values to the context dictionary that are used
        by all templates.

        Arguments:
        template -- A string containing the  path to the Jinja2/HTML template that
            should be rendered.   This assumes the '/templates' prefix and thus
            it should be omitted from the path string.

        request -- A pointer to the request object.  Used to extract information about
            the request path.  This is one of the downsides of using the
            Flask-like route decorators.
        
        context -- An optional dictionary containing the data objects that should be
            passed to the template for processing by Jinja2 to be included in
            the final HTML's output.
        """
        # Renders a template and writes the result to the response.
        if not context:
            context = {}
        user  = users.get_current_user()
        context['user'] = None
        context['user_data'] = {}
        if user:
            context['user'] = user
            user_data = memcache.get('%s-user_data' % (str(user.user_id())))
            if user_data:
                context['user_data'] = user_data
        context['request'] = request.uri
        context['login_url'] = users.create_login_url("/_post_login/?next=%s"
                % (request.url))
        context['logout_url'] = users.create_logout_url("/account/logout/")
        context['messages'] = self.get_messages() 
        rv = self.jinja2.render_template(template, **context)
        return rv

