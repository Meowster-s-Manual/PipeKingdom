extends RigidBody2D

@export var FROM_QB: bool = false

var timer = 34
var impulse = true

var currentScene

func _ready():
	currentScene = get_tree().current_scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if FROM_QB:
		gravity_scale = 1
		if (impulse):
			impulse = false
			apply_central_impulse(Vector2(0, -300))
		
		timer -= 1
		if (timer == 0):
			queue_free()
