extends Button

#Buttons
onready var playerName = $PlayerName
onready var CPUName = $CPUName
onready var number = $PlayerName/NumberPanel/Number

var viewport = null
var viewport_sprite = null

export(int) var numID

var type = 0

func _ready():
	number.set_text(str(numID))
	self.connect("pressed", self, "ChangeType")
	
	viewport = get_node("Viewport")
	viewport_sprite = get_node("Sprite")
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	viewport_sprite.texture = viewport.get_texture()
	
	type = Global.chosenPlayers[numID-1]
	type -= 1
	ChangeType()
	
	pass

func _process(delta):
	Global.chosenPlayers[numID-1] = type 
	pass

func ChangeType():
	type += 1;
	
	#Go back to 0
	if (type >= 3 || type <= -1):
		type = 0
	
	#No character
	if (type == 0):
		playerName.hide()
		CPUName.hide()
		viewport_sprite.hide()
	#Player
	elif (type == 1):
		playerName.show()
		CPUName.hide()
		viewport_sprite.show()
	#CPU
	elif (type == 2):
		playerName.hide()
		CPUName.show()
		viewport_sprite.show()
	pass