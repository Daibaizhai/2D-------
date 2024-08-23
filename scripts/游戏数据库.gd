extends Node

var score = 0

@onready var Coin_number = %"持有硬币数量"

func add_point():
	score += 1
	Coin_number.text = str(score)
