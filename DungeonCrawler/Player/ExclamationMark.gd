extends Sprite

onready var tween = $Tween

# Appears on screen
func appear() -> void:
	visible = true
	tween.interpolate_property(self, "scale", Vector2(0.1, 0.1), Vector2(0.7, 0.7), 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	tween.start()

# Disappears from screen
func _on_Tween_tween_all_completed():
	if visible:
		visible = false
