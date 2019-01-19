extends PanelContainer

var map = 0

func _ready():
	pass

func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	pass
