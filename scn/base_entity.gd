
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var cam

func _ready():
	# Initialization here
	set_process(true)
	pass

var vel = Vector3(10,0,0)

func _process(delta):
	var ray = get_node("RayCast")
	cam = get_parent().get_parent().get_parent().get_node("world/cam_root")
	set_rotation( cam.get_rotation() + Vector3(0,0.5*PI,0) )
	#print( ray.get_collider().get_name() )
	randomize()
	var rand = randi()%100
	if ( ray.get_collider() != null and ray.get_collider().get_name() == "col" and rand < 98 ):
		get_node("Sprite3D").set_translation(ray.get_collision_point()-get_translation())
		set_translation( get_translation() + delta*vel)
	else:
		set_translation( get_translation() - delta*vel)
		randomize()
		vel = Vector3(10,0,0).rotated( Vector3(0,1,0), rand_range(0,360))

