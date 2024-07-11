extends Node

@onready var _Bricks = $"../Bricks"
@onready var _QuestionBlocks = $"../QuestionBlocks"

signal get_coin

var BrickBreak = preload("res://Particles/BrickBreak.tscn")
var Coin = preload("res://PreFab/Coin.tscn")
var Shroom = preload("res://PreFab/Red mushroom.tscn")

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
				get_coin.emit()
				CollisionObject.USED = true
				var coin: Node2D = Coin.instantiate()
				coin.FROM_QB = true
				coin.find_children("CollisionShape2D")[0].disabled = true
				coin.position = CollisionObject.get_position()
				_QuestionBlocks.add_child(coin)
				CollisionObject.find_children("AnimatedSprite2D")[0].play("used")
			if (CollisionObject.ITEM == "Shroom" && CollisionObject.USED == false):
				CollisionObject.USED = true
				var shroom: Node2D = Shroom.instantiate()
				shroom.find_children("CollisionShape2D")[0].disabled = true
				shroom.set_z_index(-1)
				shroom.position = CollisionObject.get_position()
				_QuestionBlocks.add_child(shroom)
				CollisionObject.find_children("AnimatedSprite2D")[0].play("used")
				
				
				
				
