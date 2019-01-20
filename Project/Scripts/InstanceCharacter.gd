extends Spatial

var Knight = preload("res://Scenes/Characters/Knight.tscn")
var RedSkull = preload("res://Scenes/Characters/RedSkull.tscn")

var players = Global.players

func _ready():
	for aux in range(8):
		if Global.chosenPlayers[aux] == 1:
			players[aux] = Knight.instance()
			AdjustChar(aux)
		elif Global.chosenPlayers[aux] == 2:
			players[aux] = RedSkull.instance()
			AdjustChar(aux)
		
	pass

func AdjustChar(var aux):
	add_child(players[aux])
	players[aux].rotation_degrees.y = 90
	
	if aux == 0:
		players[aux].translation = Vector3(-30,5,30)
	elif aux == 1:
		players[aux].translation = Vector3(-30,5,0)
	elif aux == 2:
		players[aux].translation = Vector3(-30,5,-30)
	elif aux == 3:
		players[aux].translation = Vector3(0,5,-30)
	elif aux == 4:
		players[aux].translation = Vector3(30,5,-30)
	elif aux == 5:
		players[aux].translation = Vector3(30,5,0)
	elif aux == 6:
		players[aux].translation = Vector3(30,5,30)
	elif aux == 7:
		players[aux].translation = Vector3(0,5,30)

func _process(delta):
	pass
