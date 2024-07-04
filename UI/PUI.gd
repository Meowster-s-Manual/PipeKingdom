extends Control

@onready var _game_manager = %GameManager
@onready var total_coin = $HBoxContainer/Coins/TotalCoin

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_manager_get_coin():
	total_coin.coin_increase()
	pass # Replace with function body.
