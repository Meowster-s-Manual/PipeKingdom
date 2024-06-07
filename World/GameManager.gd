extends Node

@onready var _Bricks = $"../Bricks"
var BrickBreak = preload("res://Particles/BrickBreak.tscn")

func break_block(CollisionObject, angle):
	if _Bricks.get_children().has(CollisionObject) == true:
		if (angle > 3):
			var brickBreak: Node2D = BrickBreak.instantiate()
			brickBreak.position = CollisionObject.get_position()
			_Bricks.add_child(brickBreak)
			CollisionObject.queue_free()
