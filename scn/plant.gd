
extends Spatial

const tree_type = preload("res://scn/plant.scn")

# member variables here, example:
# var a=2
# var b="textvar"
const NUM_TREES = 300


func _ready():
	# Initialization here
	for i in range(0,NUM_TREES):
		var next = tree_type.instance()
		add_child(next)
		randomize()
		next.set_translation(Vector3(rand_range(-50,50),0,rand_range(-50,50)))
	pass

