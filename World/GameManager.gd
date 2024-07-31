extends Node

@onready var _Bricks = $"../Bricks"
@onready var _QuestionBlocks = $"../QuestionBlocks"

signal get_coin

var BrickBreak = preload("res://Particles/BrickBreak.tscn")
var Coin = preload("res://PreFab/Coin.tscn")
var Shroom = preload("res://PreFab/Red mushroom.tscn")
var Flower = preload("res://PreFab/fire flower.tscn")
var Star = preload("res://PreFab/Star.tscn")

func break_block(CollisionObject, angle, big):
	if _Bricks.get_children().has(CollisionObject) == true\
	and angle > 3:
		if big:
			var brickBreak: Node2D = BrickBreak.instantiate()
			brickBreak.position = CollisionObject.get_position()
			_Bricks.add_child(brickBreak)
			CollisionObject.queue_free()
		else:
			pass

func hit_question_block(CollisionObject, angle, big):
	if _QuestionBlocks.get_children().has(CollisionObject) == true\
	and angle > 3\
	and "USED" in CollisionObject\
	and CollisionObject.USED == false:
		match CollisionObject.ITEM:
			"Coin":
				get_coin.emit()
				CollisionObject.USED = true
				var coin: Node2D = Coin.instantiate()
				coin.FROM_QB = true
				coin.find_children("CollisionShape2D")[0].disabled = true
				coin.set_z_index(-1)
				coin.position = CollisionObject.get_position()
				_QuestionBlocks.add_child(coin)
				CollisionObject.find_children("AnimatedSprite2D")[0].play("used")
			"Shroom":
				CollisionObject.USED = true
				if big:
					var flower: Node2D = Flower.instantiate()
					flower.find_children("CollisionShape2D")[0].disabled = true
					flower.set_z_index(-1)
					flower.position = CollisionObject.get_position()
					_QuestionBlocks.add_child(flower)
				else:
					var shroom: Node2D = Shroom.instantiate()
					shroom.find_children("CollisionShape2D")[0].disabled = true
					shroom.set_z_index(-1)
					shroom.position = CollisionObject.get_position()
					_QuestionBlocks.add_child(shroom)
				CollisionObject.find_children("AnimatedSprite2D")[0].play("used")
			"Star":
				CollisionObject.USED = true
				var star: Node2D = Star.instantiate()
				star.find_children("CollisionShape2D")[0].disabled = true
				star.set_z_index(-1)
				star.position = CollisionObject.get_position()
				_QuestionBlocks.add_child(star)
				CollisionObject.find_children("AnimatedSprite2D")[0].play("used")
