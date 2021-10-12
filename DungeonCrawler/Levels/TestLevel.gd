extends Node2D

onready var key_left = $KeysLeft

func there_is_no_key_left() -> bool:
	for key in key_left.get_children():
		if key.visible:
			return false
	return true
		
func reset_keys():
	for key in key_left.get_children():
		key.show()
