extends Node2D

onready var gold_left = $GoldLeft

func there_is_no_gold_left() -> bool:
	return gold_left.get_child_count() == 0
		
