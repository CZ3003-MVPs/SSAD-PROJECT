extends Node2D

onready var panel_to_drop_code_blocks = $UI/SidePanel/PanelToDropCodeBlocks
onready var player = $TestLevel/Player

func _ready() -> void:
	panel_to_drop_code_blocks.connect("notify_sprite", player, "_on_RunCodeButton_move_sprite")
	
