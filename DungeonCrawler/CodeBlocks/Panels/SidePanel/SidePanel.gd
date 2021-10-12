extends Control

onready var panel_to_drop_code_blocks = $PanelToDropCodeBlocks
onready var run_code_button : Button = $RunCodeButton
onready var reset_button : TextureButton = $ResetButton
onready var stop_button : TextureButton = $StopButton
onready var trash_bin : TextureRect = $TrashBin
signal pressed_reset_button
signal pressed_stop_button

func _ready() -> void:
	run_code_button.connect("pressed_run_code", panel_to_drop_code_blocks, "read_code_blocks")
	run_code_button.connect("pressed_run_code", self, "enable_stop_button")
	run_code_button.connect("pressed_run_code", self, "disable_reset_button")


func _on_ResetButton_pressed():
	emit_signal("pressed_reset_button")
	run_code_button.disabled = false
	disable_reset_button()

	
func enable_reset_button():
	reset_button.disabled = false

func disable_reset_button():
	reset_button.disabled = true

func enable_stop_button():
	stop_button.disabled = false

func _on_StopButton_pressed():
	emit_signal("pressed_stop_button")
	stop_button.disabled = true
	enable_reset_button()
	
