extends Control

onready var panel = $Panel
onready var pName = $Name

export(int) var numID

func _ready():
	panel.modulate.a = 0.9
	pName.set_text("Player "+str(numID))
	#210 500
	if (Global.chosenTypePlayers[numID-1] == 0):
		self.hide()
	pass