extends Label

@export var COIN: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var text = str("X", COIN)
	set_text(text)


func coin_increase():
	COIN += 1
