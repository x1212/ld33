
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var resources = { "trees":5, "wolfs":0, "rabbits":4 }

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


