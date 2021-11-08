extends Node2D

onready var key_left = $KeysLeft

# Checks if there is key left
func there_is_no_key_left() -> bool:
	for key in key_left.get_children():
		if key.visible:
			return false
	return true

# Resets key
func reset_keys():
	for key in key_left.get_children():
		key.show()
