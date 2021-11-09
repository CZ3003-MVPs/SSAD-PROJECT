extends ColorRect

signal fade_finished

# Fades in
func fade_in():
	$AnimationPlayer.play("fade_in")

# Finishes fading
func _on_AnimationPlayer_animation_finished(_fade_in):
	emit_signal("fade_finished")
