extends Camera2D
const CAMERA_OFFSET = 1280/2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_screen_center_position()[0] > CAMERA_OFFSET:
		set_limit(SIDE_LEFT,get_screen_center_position()[0] - CAMERA_OFFSET)
	else:
		set_limit(SIDE_LEFT,0)
	limit_smoothed = true
	var viewport := get_viewport()
	var camera := viewport.get_camera_2d()
