extends RigidBody2D

var velocity = Vector2(75,0)
var timer = 500

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

	# destry self after time pass
	timer -= 1
	if (timer == 0):
		queue_free()
