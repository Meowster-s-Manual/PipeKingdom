extends CharacterBody2D

var speed = 20.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_right = true

var death_timer = 20

func _physics_process(delta):
	if death_timer < 0:
		queue_free()
	elif death_timer < 20:
		death_timer -= 1
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if $RayCast2D.is_colliding() && is_on_floor():
		flip()

	if $DeathHit.is_colliding() && $DeathHit.get_collider().get_name() == "Pipeman":
		$AnimatedSprite2D.play("Death")
		$CollisionShape2D.disabled = true
		death_timer -= 1


	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1
