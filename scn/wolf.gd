
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var food = 20.0

var cam

func _ready():
	# Initialization here
	randomize()
	get_node("Sprite3D").set_scale( rand_range(3.5,5.0)*Vector3(1,1,1))
	get_node("AnimationPlayer").play("jump",-1,rand_range(0.8,1.2))
	set_process(true)
	pass

var dead = false
var vel = Vector3(3,0,0)
var refcount = 0

var tick = 30.0

func _process(delta):
	if (dead):
		if (refcount == 0):
			queue_free()
		return
	var ray = get_node("RayCast")
	cam = get_parent().get_parent().get_parent().get_node("world/cam_root")
	if (vel.z >= 0.0 ):
		get_node("Sprite3D").set_rotation( Vector3(0, asin(vel.normalized().x)+1.5*PI ,0) )
	else:
		get_node("Sprite3D").set_rotation( Vector3(0, asin(vel.normalized().x)+0.5*PI ,0) )
	
	randomize()
	var rand = randi()%100
	if ( ray.get_collider() != null and ray.get_collider().get_name() == "col" and rand < 95 ):
		get_node("Sprite3D").set_translation(ray.get_collision_point()-get_translation())
		set_translation( get_translation() + delta*vel)
	else:
		set_translation( get_translation() - delta*vel)
		
		vel = Vector3(3,0,0).rotated( Vector3(0,1,0), rand_range(0,360))
	
	# hunger system
	if (food > 5.0):
		food -= delta*rand_range(0.0,1.0)
	elif (food > 0.0):
		food -= delta*rand_range(0.0,1.0)
		if ( get_parent().get_parent().get_node("rabbits").get_child_count() > 0 ):
			var dist = 100.0
			for i in range (0, get_parent().get_parent().get_node("rabbits").get_child_count()):
				var grass = get_parent().get_parent().get_node("rabbits").get_child(i)
				if ((grass.get_translation()-get_translation()).length() < dist):
					dist = (grass.get_translation()-get_translation()).length()
					vel = 5*((grass.get_translation()-get_translation()).normalized())
				if ( (grass.get_translation()-get_translation()).length() < 0.5 ):
					food = 25.0
					grass.queue_free()
					get_node("Sprite3D/SpatialSamplePlayer").play("rabbit_cry")
	else:
		dead = true
	
	# make more rabbits
	
	tick -= delta
	if ( tick <= 0.0 and food > 10.0 ):
		if ( get_parent().get_child_count() > 1 and get_parent().get_child_count() < get_parent().NUM_WOLFS*2):
			for i in range(0, get_parent().get_child_count()):
				var other = get_parent().get_child(i)
				if ( tick <= 0.0 and other.get_name() != get_name() and other.tick < 1.0 and other.food > 10.0):
					tick = 60.0
					other.tick = 40.0
					var new = duplicate()
					new.food = 5.0
					new.tick = 20.0
					get_parent().add_child(new)
			
			if (tick <= 0.0):
				tick = 0.99
	

