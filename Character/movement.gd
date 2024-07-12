extends CharacterBody2D

const SPEED = 150.0
const RUN = 300.0
const JUMP_VELOCITY = -250.0
const SPEED_INCREMENT = 2
var movement_speed = SPEED

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var _animated_sprite = $AnimatedSprite2D
@onready var _camera_node = $MainCamera
@onready var _game_manager = %GameManager
@onready var _small_collision = $SmallCollision
@onready var _big_collision = $BigCollision

var screen_size

var big = false
var growing = false

func _ready():
	screen_size = get_viewport_rect().size
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += (1.4 * gravity) * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY* 1.75

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if growing:
		pass
	elif direction < 0:
		if Input.is_action_pressed("Run") && movement_speed < RUN:
			movement_speed += SPEED_INCREMENT
		elif movement_speed > SPEED:
			movement_speed -= SPEED_INCREMENT
		velocity.x = direction * movement_speed
		_animated_sprite.flip_h = true
		if big:
			_animated_sprite.play("big_movement")        
		else:	
			_animated_sprite.play("movement")                                 
	elif direction > 0:
		if Input.is_action_pressed("Run") && movement_speed < RUN:
			movement_speed += SPEED_INCREMENT
		elif movement_speed > SPEED:
			movement_speed -= SPEED_INCREMENT
		velocity.x = direction * movement_speed
		_animated_sprite.flip_h = false
		if big:
			_animated_sprite.play("big_movement")
		else:
			_animated_sprite.play("movement")
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		if big:
			_animated_sprite.play("big_idle")
		else:
			_animated_sprite.play("idle")
	
	# set limit for pipeman to move out of Camera
	position.x = clamp(position.x, _camera_node.limit_left, _camera_node.limit_left + screen_size.x)

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		_game_manager.break_block(collision.get_collider(), collision.get_angle())
		_game_manager.hit_question_block(collision.get_collider(), collision.get_angle())
		

func grow_pipeman():
	get_tree().paused = true
	_small_collision.set_disabled(true)
	_big_collision.set_disabled(false)
	position.y -= 4
	growing = true
	_animated_sprite.play("growing")


func _on_animated_sprite_2d_animation_finished():
	get_tree().paused = false
	growing = false
	big = true

