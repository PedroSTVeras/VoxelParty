#1536 x 864

extends Node

#If game is paused
var paused = false

#Map choosen on the menu
var map = 0

#Type of players choosen on the menu
var chosenTypePlayers = []
var chosenModelPlayers = []

#The players in the game
var players = []

func _ready():
	chosenTypePlayers.resize(8)
	for x in range (8):
		chosenTypePlayers[x] = 0
	
	chosenModelPlayers.resize(8)
	for x in range (8):
		chosenModelPlayers[x] = 0
	
	pass
