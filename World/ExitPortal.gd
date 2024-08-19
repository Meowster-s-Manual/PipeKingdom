extends Area2D

@onready var _camera = $"../Pipeman/MainCamera"

@export var target_location: Vector2

var using: bool
var bottom_limit: int

func _input(event: InputEvent):
	if using:
		return
	
	var player: Node2D
	for body in get_overlapping_bodies():
		if body.get_name() == "Pipeman":
			player = body
			break

	if event.is_action_pressed("Right") and player != null:
		using = true
		
		#disable collision
		#need to set animation here
		
		#get_tree().create_timer(2).timeout.connect(      
			#bind() makes it so the function gets these parameters added once it is finally called.
		#Teleport the player and restore it's collisions
		player.set_position(target_location)
		_camera.set_limit(SIDE_BOTTOM, _camera.BOTTOM_LIMIT)
		using = false
		#)
