
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

const UNIT_CAP = 100

const human_gather_type = preload("res://scn/human_gather.scn")

var resources = { "trees":10, "wolfs":4, "rabbits":4 }

func add_resource( type ):
	resources[type]+=1


func get_food():
	if ( resources["rabbits"] > 0 ):
		resources["rabbits"] -= 1
		return true
	else:
		return false

func _ready():
	# Initialization here
	pass

func spawn_human_gather( pos_vec3, type ):
	if (get_child_count() > UNIT_CAP or resources["wolfs"] < 2):
		return
	print(type)
	var next = human_gather_type.instance()
	add_child(next)
	randomize()
	next.set_translation(Vector3(rand_range(-3,3) + pos_vec3.x,0,rand_range(-3,3) + pos_vec3.z))
	next.foodsource = type
	resources["wolfs"] -= 2
