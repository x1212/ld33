
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var house_type = load( "res://scn/house.scn" )

var game_over = false

func _ready():
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	if ( get_node("mobs/human").get_child_count() == 0 ):
		print( var2str(get_node("mobs/human").get_child_count()) )
		print("Game Over")
		game_over = true
	else:
		print( var2str(get_node("mobs/human").get_child_count()) )
		game_over = false


var current_source = "rabbits"

func create_house( pos_vec2 ):
	if ( get_node("mobs/human").resources["trees"] >= 5 and game_over != true ):
		var new_house = house_type.instance()
		new_house.set_translation( Vector3(pos_vec2.x, 0, pos_vec2.y ) )
		new_house.source = current_source
		get_node("mobs").add_child(new_house)
		get_node("mobs/human").resources["trees"] -= 5
		print( "house" )
		print( current_source )
	pass