extends Button

signal pressed_run_code

# Emit signal when run code button is pressed. Disables run button
func _on_RunCodeButton_pressed():
	emit_signal("pressed_run_code")
	disabled = true
