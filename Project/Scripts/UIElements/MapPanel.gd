extends Panel

onready var playButton = $PlayButton
onready var leftButton = $LeftButton
onready var rightButton = $RightButton

onready var mapNumber = $MapNumber

func _ready():
	leftButton.connect("pressed", self, "PrevMap")
	rightButton.connect("pressed", self, "NextMap")
	playButton.connect("pressed",self,"NextScreen")
	pass

func _process(delta):
	mapNumber.set_text(str(Global.map))
	
	if Input.is_action_just_pressed("ui_leftJoy_right") || Input.is_action_just_pressed("ui_right"):
		NextMap()
	if Input.is_action_just_pressed("ui_leftJoy_left") || Input.is_action_just_pressed("ui_left"):
		PrevMap()
	
	if Input.is_action_just_pressed("ui_A"):
		NextScreen()
	pass

func NextMap():
	Global.map += 1
	if Global.map >= 3:
		Global.map = 0

func PrevMap():
	Global.map -= 1
	if Global.map <= -1:
		Global.map = 2

func NextScreen():
	get_tree().change_scene("res://Scenes/Menus/PlayerSelectMenu.tscn");

