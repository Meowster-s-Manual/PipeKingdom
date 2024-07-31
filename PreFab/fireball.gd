extends RigidBody2D
var velocity = Vector2(150,175)
var timer = 200

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_angle() != 0:
			queue_free()
		velocity = velocity.bounce(collision.get_normal())

	# destry self after time pass
	timer -= 1
	if (timer == 0):
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.queue_free()
