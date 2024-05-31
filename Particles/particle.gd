class_name Particle
extends Node2D

@export var lifespan_seconds: float = 3.0
@export var gravity: float = 1300.0
@export var velocity: Vector2 = Vector2.ZERO
const SPEED: float = sqrt(7200)


func _ready():
	get_tree().create_timer(lifespan_seconds).connect("timeout", queue_free)


func _physics_process(delta):
	velocity.y += 1300.0 * delta
	position += velocity * delta
	for child in get_children():
		child.position += child.position.normalized() * SPEED * delta
