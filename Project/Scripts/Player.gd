extends KinematicBody

var gravity = -100
var velocity = Vector3()
var camera

const SPEED = 60
const ACCELERATION = 15
const DE_ACCELERATION = 25

func _ready():
	camera = get_node("../Camera").get_global_transform()
	pass

func _physics_process(delta):
	var dir = Vector3()
	if(Input.is_action_pressed("ui_leftJoy_up")):
		dir += -camera.basis[2]
	if(Input.is_action_pressed("ui_leftJoy_down")):
		dir += camera.basis[2]
	if(Input.is_action_pressed("ui_leftJoy_left")):
		dir += -camera.basis[0]
	if(Input.is_action_pressed("ui_leftJoy_right")):
		dir += camera.basis[0]
	
	dir.y = 0
	dir = dir.normalized()
	velocity.y += delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	velocity.x = hv.x
	velocity.z = hv.z
	velocity = move_and_slide(velocity, Vector3(0,1,0))