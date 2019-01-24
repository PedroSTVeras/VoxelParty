extends Spatial

#Character models prefab
var Knight = preload("res://Scenes/Objects/Characters/Knight.tscn")
var RedSkull = preload("res://Scenes/Objects/Characters/RedSkull.tscn")
var Hero = preload("res://Scenes/Objects/Characters/Hero.tscn")

#Player profile prefab
var profile = preload("res://Scenes/UIElements/PlayerProfile.tscn")

#Class prefab for players
const playerClass = preload("res://Scripts/Classes/PlayerClass.gd")

#Pointer to Global players
var players = Global.players

var num = 0

func _ready():
	for aux in range(8):
		#Spawn player class
		if Global.chosenTypePlayers[aux] != 0:
			players.resize(num+1)
			players[num] = playerClass.new()
			
			#Instance models on classes
			if Global.chosenModelPlayers[aux] == 0:
				players[num].model = Knight.instance()
				AdjustChar(num)
			elif Global.chosenModelPlayers[aux] == 1:
				players[num].model = RedSkull.instance()
				AdjustChar(num)
			elif Global.chosenModelPlayers[aux] == 2:
				players[num].model = Hero.instance()
				AdjustChar(num)
			
			#Set color and model ID
			players[num].colorID = aux +1
			players[num].modelID = Global.chosenModelPlayers[aux]
			
			#Instance profiles
			players[num].profile = profile.instance()
			players[num].profile.num = num
			
			#Set positon
			players[num].profile.rect_position += Vector2(20 + 425*num, 720)
			if num >= 4:
				players[num].profile.rect_position += Vector2(20 + 425*(num-4), 20)
			add_child(players[num].profile)
			num +=1
	pass

#Adds characters to scene and properly places them in the scene
func AdjustChar(var aux):
	add_child(players[aux].model)
	players[aux].model.rotation_degrees.y = 90
	
	if aux == 0:
		players[aux].model.translation = Vector3(30,5,30)
	elif aux == 1:
		players[aux].model.translation = Vector3(30,5,0)
	elif aux == 2:
		players[aux].model.translation = Vector3(30,5,-30)
	elif aux == 3:
		players[aux].model.translation = Vector3(0,5,15)
	elif aux == 4:
		players[aux].model.translation = Vector3(0,5,-15)
	elif aux == 5:
		players[aux].model.translation = Vector3(-30,5,30)
	elif aux == 6:
		players[aux].model.translation = Vector3(-30,5,0)
	elif aux == 7:
		players[aux].model.translation = Vector3(-30,5,-30)