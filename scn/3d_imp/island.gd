
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass




func _on_col_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if ( event.type == InputEvent.MOUSE_BUTTON and event.is_pressed() and Input.is_mouse_button_pressed(1) ):
		get_parent().get_parent().create_house( Vector2(click_pos.x,click_pos.z) )
	
	pass # replace with function body
