extends Area2D

onready var timer = $Timer

func _input(event) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_P:
			collect()


func collect() -> void:
	monitoring = true	
	timer.start()


func _on_AreaToCollect_area_entered(area):
	# hide keys upon collecting instead of queue freeing
	area.hide()
	AudioManager.play_sfx("CollectKey")

func _on_Timer_timeout():
	monitoring = false
