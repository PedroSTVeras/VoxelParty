extends Button

#Buttons
onready var playerName = $PlayerName
onready var CPUName = $CPUName

var type = 0

func _ready():
	self.connect("pressed", self, "ChangeType")
	pass

func _process(delta):
	pass

func ChangeType():
	type += 1;
	
	#Go back to 0
	if (type == 3):
		type = 0
	
	#No character
	if (type == 0):
		playerName.hide()
		CPUName.hide()
	#Player
	elif (type == 1):
		playerName.show()
		CPUName.hide()
	#CPU
	elif (type == 2):
		playerName.hide()
		CPUName.show()
	pass