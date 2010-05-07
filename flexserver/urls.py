from django.conf.urls.defaults import *
from django.conf import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^admin(.*)', admin.site.root),
    (r'^flexserver/login/$', 'flexserver.server.views.user_login'),
    (r'^flexserver/finalscore/$', 'flexserver.server.views.compute_final_score'),
    (r'^flexserver/relations/$', 'flexserver.server.views.process_answer'),
    (r'^flexserver/checkup/$', 'flexserver.server.views.checkup'),
    (r'^flexserver/flagquestion/$', 'flexserver.server.views.flagquestion'),
    (r'^flexserver/users/$', 'flexserver.server.views.create_account'),
    (r'^$','flexserver.server.views.game'),
    (r'^(.*)$', 'django.views.static.serve', {'document_root': settings.BASE_DIR+"/server/game/"}), 
)
