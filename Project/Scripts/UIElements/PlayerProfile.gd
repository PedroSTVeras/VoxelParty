extends Control

onready var panel = $Panel
onready var pName = $Name

var numID

var viewport = null
var viewport_sprite = null

func _ready():
	#Set Profile Name
	pName.set_text("Player "+str(numID))
	
	#Set color
	if numID == 1:
		panel.modulate = Color("69504dbb")
	elif numID == 2:
		panel.modulate = Color("694dbb6e")
	elif numID == 3:
		panel.modulate = Color("69bbb14d")
	elif numID == 4:
		panel.modulate = Color("69bb554d")
	elif numID == 5:
		panel.modulate = Color("69bb4db6")
	elif numID == 6:
		panel.modulate = Color("691fb9b2")
	elif numID == 7:
		panel.modulate = Color("69ffffff")
	elif numID == 8:
		panel.modulate = Color("69000000")
	panel.modulate.a = 1
	
	#Viewport
	viewport = get_node("Viewport")
	viewport_sprite = get_node("Sprite")
	
	#Get texture
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	viewport_sprite.texture = viewport.get_texture()
	
	pass




