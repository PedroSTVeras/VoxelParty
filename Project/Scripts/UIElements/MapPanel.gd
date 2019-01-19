extends Panel

onready var playButton = $PlayButton
onready var leftButton = $LeftButton
onready var rightButton = $RightButton

onready var leftPanel = $LeftPanel
onready var rightPanel = $RightPanel
onready var nextPanel = $NextPanel

onready var mapNumber = $MapNumber

var row = 0

func _ready():
	leftButton.connect("pressed", self, "PrevMap")
	rightButton.connect("pressed", self, "NextMap")
	playButton.connect("pressed",self,"NextScreen")
	pass

func _process(delta):
	mapNumber.set_text(str(Global.map))
	
	if Input.is_action_just_pressed("ui_leftJoy_up") || Input.is_action_just_pressed("ui_up") || Input.is_action_just_pressed("ui_leftJoy_down") || Input.is_action_just_pressed("ui_down"):
		if row == 0:
			row = 1
		else:
			row = 0
	
	if row == 0:
		if Input.is_action_just_pressed("ui_leftJoy_right") || Input.is_action_just_pressed("ui_right"):
			NextMap()
		if Input.is_action_just_pressed("ui_leftJoy_left") || Input.is_action_just_pressed("ui_left"):
			PrevMap()
		
		rightPanel.show()
		leftPanel.show()
		nextPanel.hide()
	
	if row == 1:
		if Input.is_action_just_pressed("ui_A"):
			NextScreen()
		
		rightPanel.hide()
		leftPanel.hide()
		nextPanel.show()
	
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

