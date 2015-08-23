
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var house_type = load( "res://scn/house.scn" )


func _ready():
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	
	pass


func create_house( pos_vec2 ):
	var new_house = house_type.instance()
	new_house.set_translation( Vector3(pos_vec2.x, 0, pos_vec2.y ) )
	get_node("mobs/human").add_child(new_house)
	pass