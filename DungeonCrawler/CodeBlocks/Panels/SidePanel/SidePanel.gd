extends Control

onready var panel_to_drop_code_blocks = $PanelToDropCodeBlocks
onready var run_code_button : Button = $RunCodeButton
onready var reset_button : TextureButton = $ResetButton
onready var stop_button : TextureButton = $StopButton
onready var trash_bin : TextureRect = $TrashBin
onready var speed_button : Button = $SpeedButton
signal pressed_reset_button
signal pressed_stop_button
signal pressed_back_button

# Loads at start
func _ready() -> void:
	run_code_button.connect("pressed_run_code", panel_to_drop_code_blocks, "read_code_blocks")
	run_code_button.connect("pressed_run_code", self, "enable_stop_button")
	run_code_button.connect("pressed_run_code", self, "disable_reset_button")

# Emits signal when reset button is pressed
func _on_ResetButton_pressed():
	emit_signal("pressed_reset_button")
	run_code_button.disabled = false
	disable_reset_button()

# Enables reset button
func enable_reset_button():
	reset_button.disabled = false

# Disables reset button
func disable_reset_button():
	reset_button.disabled = true

# Enables stop button
func enable_stop_button():
	stop_button.disabled = false

# Emits signal when stop button is pressed
func _on_StopButton_pressed():
	emit_signal("pressed_stop_button")
	stop_button.disabled = true
	enable_reset_button()
	

# Emits signal when back button is pressed
func _on_BackButton_pressed():
	emit_signal("pressed_back_button")
	
