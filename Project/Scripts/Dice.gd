extends RigidBody

var diceMass = 25
var force = 1000

func _ready():
	randomize()
	self.mass = diceMass
	ApplyForce()
	
	pass

func ApplyForce():
	self.translation = Vector3(randi()%7 - 3,0,randi()%7 - 3)
	self.rotation_degrees = Vector3(randi()%360,randi()%360,randi()%360)
	self.apply_impulse(Vector3(randi()%7 - 3,randi()%7 - 3,randi()%7 - 3),Vector3(randi()%20 - 10,force,randi()%20 - 10))
	pass

func _process(delta):
	#var bodies=get_colliding_bodies()
	#print (bodies)
	#print(1)
#	if bodies != null:
#		print(bodies[0].get_name())
	pass
