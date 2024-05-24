extends Camera2D
const ZOOM_LEVEL = 3
const CAMERA_OFFSET = 1280/(2*ZOOM_LEVEL)
const BOTTOM_LIMIT = 240

# Called when the node enters the scene tree for the first time.
func _ready():
	var zoom_level = Vector2(ZOOM_LEVEL, ZOOM_LEVEL)
	set_zoom(zoom_level)
	set_limit(SIDE_BOTTOM , BOTTOM_LIMIT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# set left limit and updates whenever move right
	if get_screen_center_position()[0] > CAMERA_OFFSET:
		set_limit(SIDE_LEFT, int(get_screen_center_position()[0] - CAMERA_OFFSET))
	else:
		set_limit(SIDE_LEFT,0)
