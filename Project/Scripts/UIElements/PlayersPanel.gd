extends Panel

onready var selectPanel = $Panel
onready var selectPanel2 = $NextPanel
onready var playButton = $PlayButton

var column = 0
var row = 0

func _ready():
	playButton.connect("pressed",self,"NextScreen")
	pass

func _process(delta):
	
	#Control panel
	if Input.is_action_just_pressed("ui_leftJoy_right") || Input.is_action_just_pressed("ui_right"):
		column += 1
		if column >= 4:
			column = 0
	if Input.is_action_just_pressed("ui_leftJoy_left") || Input.is_action_just_pressed("ui_left"):
		column -= 1
		if column <= -1:
			column = 3
	if Input.is_action_just_pressed("ui_leftJoy_up") || Input.is_action_just_pressed("ui_up"):
		row -= 1
		if row <= -1:
			row = 2
	if Input.is_action_just_pressed("ui_leftJoy_down") || Input.is_action_just_pressed("ui_down"):
		row += 1
		if row >= 3:
			row = 0
	
	#Move arrow
	selectPanel.rect_position.x = 10 + column * 200;
	selectPanel.rect_position.y = 50 + row * 230;
	if row == 2:
		selectPanel.hide()
		selectPanel2.show()
	else:
		selectPanel.show()
		selectPanel2.hide()
	
	#Activate selected button
	if Input.is_action_just_pressed("ui_A"):
		#Change character
		if (row !=2):
			get_node("PlayerButtons/PlayerButton"+str(1+column+(row*4))).ChangeType()
		else:
			NextScreen()
	
	if Input.is_action_just_pressed("ui_B"):
		PrevScreen()
	
	pass

func NextScreen():
	get_tree().change_scene("res://Scenes/Menus/RulesSelectMenu.tscn");

func PrevScreen():
	get_tree().change_scene("res://Scenes/Menus/MapSelectMenu.tscn");
