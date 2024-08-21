extends RigidBody2D
var velocity = Vector2(150,175)
var timer = 200

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider().name != "Pipeman":
			velocity = velocity.bounce(collision.get_normal())
		#if collision.get_angle() != 0:
			#queue_free()

	# destry self after time pass
	timer -= 1
	if (timer == 0):
		queue_free()

func set_dir(dir):
	set_rotation(dir)
	velocity = velocity.rotated(dir)

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.queue_free()
	queue_free()
