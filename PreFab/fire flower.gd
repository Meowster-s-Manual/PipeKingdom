extends RigidBody2D

@onready var collision_shape_2d = $CollisionShape2D
var velocity = Vector2(1,0)
const SPAWN_TIMER = 110
var spawn_timer = SPAWN_TIMER

var check_spawn = false

func _physics_process(delta):
	
	if spawn_timer == SPAWN_TIMER:
		set_gravity_scale(0)
		set_linear_velocity(Vector2(0,-10))
	if spawn_timer == 0:
		set_linear_velocity(Vector2(0,0))
		check_spawn = true
		set_gravity_scale(1)
		collision_shape_2d.disabled = false
		
	spawn_timer -= 1
	#if check_spawn:
		#var collision = move_and_collide(velocity * delta)
		#if collision:
			#print(collision.get_collider().name)
			#if collision.get_collider().name == "Pipeman" && collision.get_collider().big:
				#collision.get_collider().fire_pipeman()
				#queue_free()
			#velocity = velocity.bounce(collision.get_normal())

