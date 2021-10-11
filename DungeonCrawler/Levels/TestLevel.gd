extends Node2D

onready var gold_left = $GoldLeft

func there_is_no_gold_left() -> bool:
	for gold in gold_left.get_children():
		if gold.visible:
			return false
	return true
		
func reset_gold():
	for gold in gold_left.get_children():
		gold.show()
