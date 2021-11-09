# This manages the area2d attached to the player.
# It is used to detect if a key is on top of the player
# when the collect code block is executed.
extends Area2D

onready var timer = $Timer

# Checks input, collects if P
# For debug purposes
#func _input(event) -> void:
#	if event is InputEventKey:
#		if event.scancode == KEY_P:
#			collect()

# Collects key if possible
func collect() -> void:
	monitoring = true	
	timer.start()

# Triggers when key enters AreaToCollect,
# this will trigger if collect() is called beforehand
func _on_AreaToCollect_area_entered(area):
	# hide keys upon collecting instead of queue freeing
	area.hide()
	AudioManager.play_sfx("CollectKey")

# Triggers on timer timeout
func _on_Timer_timeout():
	monitoring = false
