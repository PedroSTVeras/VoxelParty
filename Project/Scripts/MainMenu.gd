extends Node2D

#Buttons
onready var playButton = $Buttons/Play
onready var miniGamesButton = $Buttons/MiniGames
onready var profilesButton = $Buttons/Profiles
onready var optionsButton = $Buttons/Options
onready var exitButton = $Buttons/Exit

#Arrow
onready var arrow = $Arrow

#Selected Button
var buttonNum = 0

func _ready():
	playButton.connect("pressed", self, "PlayGame")
	exitButton.connect("pressed",self, "ExitGame")
	pass

func _process(delta):
	
	#Control arrow
	if Input.is_action_just_pressed("ui_leftJoy_up") || Input.is_action_just_pressed("ui_up"):
		buttonNum -= 1
		if buttonNum <= -1:
			buttonNum = 4
	if Input.is_action_just_pressed("ui_leftJoy_down") || Input.is_action_just_pressed("ui_down"):
		buttonNum += 1
		if buttonNum >= 5:
			buttonNum = 0
	
	#Move arrow
	arrow.rect_position.y = 210 + buttonNum * 60;
	
	#Activate selected button
	if Input.is_action_just_pressed("ui_A"):
		if buttonNum == 0:
			PlayGame()
		elif buttonNum == 4:
			ExitGame()
	
	pass

func PlayGame():
	get_tree().change_scene("res://Scenes/Menus/PlayerSelectMenu.tscn");
	pass

func ExitGame():
	get_tree().quit();
	pass

