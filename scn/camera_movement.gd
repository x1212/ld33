
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"
var CAM_ROT_SPEED = 0.5
var CAM_ZOOM_SPEED = 10

func _ready():
	set_process(true)
	pass


func _process(delta):
	var rot = get_rotation()
	var zoom = get_node("Camera").get_fov()
	if (Input.is_action_pressed("camera_moove_right")):
		rot.y += delta*CAM_ROT_SPEED
		set_rotation(rot)
	if (Input.is_action_pressed("camera_moove_left")):
		rot.y -= delta*CAM_ROT_SPEED
		set_rotation(rot)
	if (Input.is_action_pressed("camera_zoom_in")):
		zoom -= delta*CAM_ZOOM_SPEED
		get_node("Camera").set_perspective(zoom, 1, 300)
	if (Input.is_action_pressed("camera_zoom_out")):
		zoom += delta*CAM_ZOOM_SPEED
		get_node("Camera").set_perspective(zoom, 1, 300)
	

