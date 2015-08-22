
extends Spatial

const tree_type = preload("res://scn/plant.scn")

# member variables here, example:
# var a=2
# var b="textvar"
const NUM_TREES = 300

func spawn_plant( pos ):
	if (get_child_count() > NUM_TREES):
		return
	var next = tree_type.instance()
	add_child(next)
	randomize()
	next.set_translation(Vector3(rand_range(-3,3) + pos.x,0,rand_range(-3,3) + pos.z))

func _ready():
	# Initialization here
	#for i in range(0,NUM_TREES):
	#	randomize()
	#	spawn_plant(Vector3( rand_range(-50.0,50.0), 0, rand_range(-50.0,50.0)))
	pass

