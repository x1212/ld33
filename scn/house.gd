
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var cam

func _ready():
	# Initialization here
	set_process(true)
	pass

var vel = Vector3(0,0,0)
var tick = 0.0

var source = "rabbits"
var spawner = true

func _process(delta):
	var ray = get_node("RayCast")
	#print( ray.get_collider().get_name() )
	randomize()
	var rand = randi()%100
	if (get_node("Sprite3D").get_translation().y < 1.0):
		if ( ray.get_collider() != null and ray.get_collider().get_name() == "col" and rand < 98 ):
			get_node("Sprite3D").set_translation(ray.get_collision_point()-get_translation())
			set_translation( get_translation() + delta*vel)
		else:
			set_translation( get_translation() - delta*vel)
			randomize()
			vel = Vector3(0,0,0).rotated( Vector3(0,1,0), rand_range(0,360))
	rand = randi()%1000
	if ( tick < 0.0 and spawner ):
		get_parent().get_node("human").spawn_human_gather( get_translation(), source )
		tick = 20.0
		spawner = false
		print("spawn_human")
	elif ( tick < 0.0 and rand < 500):
		tick = 20.0
	elif ( tick < 0.0 and ( spawner == false )):
		randomize()
		get_parent().get_node("human").spawn_human_gather( get_translation() + Vector3(rand_range(1.0,3.0),0,0).rotated( Vector3(0,1,0), rand_range(0,360)), "eater" )
	else:
		tick -= delta
	return