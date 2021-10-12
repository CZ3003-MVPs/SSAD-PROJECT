extends Node2D

onready var background = $UI/Background
onready var panel_to_drop_code_blocks = $UI/SidePanel/PanelToDropCodeBlocks
onready var side_panel = $UI/SidePanel
export (NodePath) var level_node_path
export (PackedScene) var next_level
onready var level = get_node(level_node_path)
onready var end_goal = level.get_node("EndGoal")
onready var player = level.get_node("Player")
onready var level_statistics
signal statistics_ready

func _ready() -> void:
	panel_to_drop_code_blocks.connect("notify_sprite", player, "_on_RunCodeButton_move_sprite")
	#background.connect("discarded_code_block", panel_to_drop_code_blocks, "delete_space_which_discarded_block_originated")
	side_panel.trash_bin.connect("discarded_code_block", panel_to_drop_code_blocks, "delete_space_which_discarded_block_originated")
	side_panel.connect("pressed_reset_button", player, "reset_sprite_position")
	side_panel.connect("pressed_reset_button", level, "reset_keys")
	side_panel.connect("pressed_reset_button", end_goal, "turn_off_monitoring")
	side_panel.connect("pressed_reset_button", player, "unterminate")
	
	side_panel.connect("pressed_stop_button", player, "terminate")
	
	# After executing code, end goal will turn on it's monitoring and check if player is on end goal
	# If player would to reach end goal without finishing executing code, nothing will happen
	player.connect("finished_executing_code", self, "on_finished_executing_code")
	end_goal.connect("player_reached_end_goal", self, "on_player_reached_end_goal")
	

func _input(event) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_R:
			reset_level()

# to allow for easier testing
# this resets everything (player position, code blks, gold)
func reset_level():
	get_tree().reload_current_scene()



func on_player_reached_end_goal() -> void:
	if level.there_is_no_key_left():
		print("YAY Woohooooo!!")
		var no_of_code_blocks = panel_to_drop_code_blocks.count_code_blocks()
		var no_of_collisions = level_statistics[0]
		var no_of_steps = level_statistics[1]
		level_statistics.append(no_of_code_blocks)
		# End goal statistics
		print("!! SUMMARY !! No of collisions: " + str(no_of_collisions) + "; No of steps: " + str(no_of_steps) + "; No of code blocks: " + str(no_of_code_blocks))
		emit_signal("statistics_ready", level_statistics)
		print(level_statistics)
		#get_tree().change_scene_to(next_level)
	else:
		print("Oh no! There's still keys left...")
	# stop executing instructions
	# congratualate player via UI
	# UI will allow player to go to next level


func on_finished_executing_code(statistics) -> void:
	end_goal.turn_on_monitoring()
	side_panel.enable_reset_button()
	update_statistics(statistics)


func update_statistics(statistics):
	level_statistics = statistics
