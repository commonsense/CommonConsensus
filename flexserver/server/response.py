
from django.core import serializers
from models import Games, AuthUser
from xml.dom import minidom
import to_dicts


def start_game():
    # returns a game from the game table with return as the question
    game=Games.objects.all()[0]
    return to_dicts.game_dict(game)
        
def continue_game():
    # returns a game from the game table
    game=Games.objects.all()[0]
    return to_dicts.continue_game_dict(game)

