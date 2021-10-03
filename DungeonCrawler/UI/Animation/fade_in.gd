extends ColorRect

signal fade_finished

func fade_in():
	$AnimationPlayer.play("fade_in")

func _on_AnimationPlayer_animation_finished(fade_in):
	emit_signal("fade_finished")
