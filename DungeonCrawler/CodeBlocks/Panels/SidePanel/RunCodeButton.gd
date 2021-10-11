extends Button

signal pressed_run_code

func _on_RunCodeButton_pressed():
	emit_signal("pressed_run_code")
	disabled = true
