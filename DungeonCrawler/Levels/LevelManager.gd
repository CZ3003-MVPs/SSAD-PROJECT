extends Node2D

onready var background = $UI/Background
onready var panel_to_drop_code_blocks = $UI/SidePanel/PanelToDropCodeBlocks
onready var player = $TestLevel/Player

func _ready() -> void:
	panel_to_drop_code_blocks.connect("notify_sprite", player, "_on_RunCodeButton_move_sprite")
	background.connect("discarded_code_block", panel_to_drop_code_blocks, "delete_space_which_discarded_block_originated")


# to reset level
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_R:
			get_tree().change_scene("res://DungeonCrawler/Levels/TestLevelManager.tscn")
