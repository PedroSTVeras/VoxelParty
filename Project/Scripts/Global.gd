extends PanelContainer

#If game is paused
var paused = false

#Map choosen on the menu
var map = 0

#Choosen players on the menu
var chosenPlayers = []

#The players in the game
var players =[]

func _ready():
	chosenPlayers.resize(8)
	for x in range (8):
		chosenPlayers[x] = 0
	players.resize(8)
	pass

func _process(delta):
	#if Input.is_action_just_pressed("ui_cancel"):
	#	get_tree().quit()
	
	pass
