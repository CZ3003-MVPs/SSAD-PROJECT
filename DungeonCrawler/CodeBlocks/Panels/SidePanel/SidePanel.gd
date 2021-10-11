extends Control

onready var panel_to_drop_code_blocks = $PanelToDropCodeBlocks
onready var run_code_button : Button = $RunCodeButton
onready var reset_button : TextureButton = $ResetButton
signal pressed_reset_button


func _ready() -> void:
	run_code_button.connect("pressed_run_code", panel_to_drop_code_blocks, "read_code_blocks")
	

func _on_ResetButton_pressed():
	emit_signal("pressed_reset_button")
	run_code_button.disabled = false
	reset_button.disabled = true

	
func enable_reset_button():
	reset_button.disabled = false
