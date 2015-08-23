
extends HBoxContainer

# member variables here, example:
# var a=2
# var b="textvar"

var scale = 1.0

func _ready():
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	if (OS.get_video_mode_size().y <= 600 ):
		scale=600.0/OS.get_video_mode_size().y
	else:
		scale=1.0
	set_pos( Vector2(0,OS.get_video_mode_size().y-get_size().y/scale) )
	for i in range( get_child_count()):
		if ( get_child(i) extends TextureButton ):
			get_child(i).set_scale(Vector2(1.0/scale,1.0/scale))
