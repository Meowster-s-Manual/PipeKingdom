extends Node

@onready var _Bricks = $"../Bricks"
@onready var _QuestionBlocks = $"../QuestionBlocks"
var BrickBreak = preload("res://Particles/BrickBreak.tscn")
var Coin = preload("res://PreFab/Coin.tscn")

func break_block(CollisionObject, angle):
	if _Bricks.get_children().has(CollisionObject) == true:
		if (angle > 3):
			var brickBreak: Node2D = BrickBreak.instantiate()
			brickBreak.position = CollisionObject.get_position()
			_Bricks.add_child(brickBreak)
			CollisionObject.queue_free()

func hit_question_block(CollisionObject, angle):
	if _QuestionBlocks.get_children().has(CollisionObject) == true:
		if (angle > 3):
			if (CollisionObject.ITEM == "Coin" && CollisionObject.USED == false):
				CollisionObject.USED = true
				var coin: Node2D = Coin.instantiate()
				coin.position = CollisionObject.get_position()
				_QuestionBlocks.add_child(coin)
				CollisionObject.find_children("AnimatedSprite2D")[0].play("used")
				#CollisionObject.queue_free()
