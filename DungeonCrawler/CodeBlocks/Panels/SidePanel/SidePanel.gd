extends Control

onready var panel_to_drop_code_blocks = $PanelToDropCodeBlocks
onready var run_code_button : Button = $RunCodeButton

func _ready() -> void:
	run_code_button.connect("pressed_run_code", panel_to_drop_code_blocks, "read_code_blocks")
