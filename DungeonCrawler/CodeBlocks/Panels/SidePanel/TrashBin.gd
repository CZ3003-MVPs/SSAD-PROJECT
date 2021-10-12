extends TextureRect

signal discarded_code_block(data_dict)
onready var tween = $Tween

func can_drop_data(position, data):
	return data.has("space_index")


func drop_data(position, data):
	#notify LevelManager that a code blk has been discarded
	emit_signal("discarded_code_block", data)


func _on_TrashBin_mouse_entered():
	expand()


func _on_TrashBin_mouse_exited():
	contract()


func expand() -> void:
	tween.interpolate_property(self, "rect_scale", Vector2(1, 1), Vector2(1.1, 1.1), 0.3, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()


func contract() -> void:
	tween.interpolate_property(self, "rect_scale", Vector2(1.1, 1.1), Vector2(1, 1), 0.3, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
