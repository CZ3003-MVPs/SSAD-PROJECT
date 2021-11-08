extends Area2D

onready var timer = $Timer

# Checks input, collects if P
func _input(event) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_P:
			collect()

# Collects
func collect() -> void:
	monitoring = true	
	timer.start()

# Triggers on collecting
func _on_AreaToCollect_area_entered(area):
	# hide keys upon collecting instead of queue freeing
	area.hide()
	AudioManager.play_sfx("CollectKey")

# Triggers on timer timeout
func _on_Timer_timeout():
	monitoring = false
