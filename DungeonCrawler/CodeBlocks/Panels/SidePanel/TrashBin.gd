extends TextureRect

signal discarded_code_block(data_dict)
onready var tween = $Tween

# Checks if data can be dropped
func can_drop_data(position, data):
	return data.has("space_index")

# Emits signal to drop data
func drop_data(position, data):
	#notify LevelManager that a code blk has been discarded
	emit_signal("discarded_code_block", data)

# Expands when item is dragged to trashbin
func _on_TrashBin_mouse_entered():
	expand()

# Contracts when item is dragged out of trashbin
func _on_TrashBin_mouse_exited():
	contract()

# Expands trash bin
func expand() -> void:
	tween.interpolate_property(self, "rect_scale", Vector2(0.5, 0.5), Vector2(0.6, 0.6), 0.3, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()

# Contracts trash bin
func contract() -> void:
	tween.interpolate_property(self, "rect_scale", Vector2(0.6, 0.6), Vector2(0.5, 0.5), 0.3, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
