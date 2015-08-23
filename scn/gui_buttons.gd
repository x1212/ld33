
extends HBoxContainer

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	set_pos( Vector2(0,OS.get_video_mode_size().y-get_size().y) )
