"""
Import this module to use Google App Engine models offline

Change USE_DEV = False if you want to connect to the remote datastore.

By Dustin Smith. 2012
"""


import sys
import os
import gitpass

USE_DEV = True 
GAE_USERNAME = gitpass.gitpass("GAE Username", "GAE Username (email)")
APP_NAME = "commonconsensus-dms" #gitpass.gitpass("App Name")
SDK_PATH = '/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine'
paths = [SDK_PATH,
         os.path.abspath("../../"),
         os.path.abspath("../../lib"),
         os.path.join(SDK_PATH, 'lib', 'yaml', 'lib')]
for p in paths:
    sys.path.append(p)

os.environ['APPLICATION_ID'] =  APP_NAME
import dev_appserver
dev_appserver.fix_sys_path() 

from datastore.human import *
from google.appengine.ext.remote_api import remote_api_stub

os.environ['AUTH_DOMAIN'] = GAE_USERNAME
os.environ['USER_EMAIL'] = GAE_USERNAME 
servername = APP_NAME + ".appspot.com" 
if USE_DEV:
    APP_NAME = "dev~" + APP_NAME
    servername = "localhost:8080"
else:
    APP_NAME = "s~" + APP_NAME

password = gitpass.gitpass('GAE Password')
def auth_function():
    return (GAE_USERNAME, password)


remote_api_stub.ConfigureRemoteDatastore(APP_NAME,  '/_ah/remote_api',
        auth_function, servername=servername)
