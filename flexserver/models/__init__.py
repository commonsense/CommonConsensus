

class GameCreationException(Exception):
    """
    A special exception for when a game is created with a bad concept
    """
    pass
    
    
from concept import *
from player import *
from game import *
from question import *