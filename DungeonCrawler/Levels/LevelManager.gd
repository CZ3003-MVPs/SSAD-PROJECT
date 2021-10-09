extends Node2D

onready var background = $UI/Background
onready var panel_to_drop_code_blocks = $UI/SidePanel/PanelToDropCodeBlocks
onready var end_goal = $TestLevel/EndGoal
onready var player = $TestLevel/Player
export(NodePath) var level_node_path
onready var level = get_node(level_node_path)

func _ready() -> void:
	panel_to_drop_code_blocks.connect("notify_sprite", player, "_on_RunCodeButton_move_sprite")
	background.connect("discarded_code_block", panel_to_drop_code_blocks, "delete_space_which_discarded_block_originated")
	
	# After executing code, end goal will turn on it's monitoring and check if player is on end goal
	# If player would to reach end goal without finishing executing code, nothing will happen
	player.connect("finished_executing_code", end_goal, "turn_on_monitoring")
	end_goal.connect("player_reached_end_goal", self, "on_player_reached_end_goal")
	
# to reset level
func _input(event) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_R:
			get_tree().change_scene("res://DungeonCrawler/Levels/TestLevelManager.tscn")


func on_player_reached_end_goal() -> void:
	if level.there_is_no_gold_left():
		print("YAY Woohooooo!!")
	else:
		print("Oh no! There's still gold left...")
	# stop executing instructions
	# congratualate player via UI
	# UI will allow player to go to next level
