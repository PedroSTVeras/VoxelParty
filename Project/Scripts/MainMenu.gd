extends Node2D

onready var playButton = $Play
onready var miniGamesButton = $MiniGames
onready var profilesButton = $Profiles
onready var optionsButton = $Options
onready var exitButton = $Exit


func _ready():
	playButton.connect("pressed", self, "PlayGame")
	exitButton.connect("pressed",self, "ExitGame")
	pass

func PlayGame():
	get_tree().change_scene("res://Scenes/Map/TestMap.tscn");
	pass

func ExitGame():
	get_tree().quit();
	pass

