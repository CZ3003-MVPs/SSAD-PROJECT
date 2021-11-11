extends Node2D

onready var background = $UI/Background
onready var panel_to_drop_code_blocks = $UI/SidePanel/PanelToDropCodeBlocks
onready var side_panel = $UI/SidePanel
export (NodePath) var level_node_path
export (PackedScene) var next_level
onready var level = get_node(level_node_path)
onready var end_goal = level.get_node("EndGoal")
onready var player = level.get_node("Player")
onready var level_complete_pop_up = $CanvasLayer/LevelCompletePopup
onready var quit_level_pop_up = $CanvasLayer/QuitLevelConfirmation
onready var level_statistics
onready var no_of_code_blocks
signal statistics_ready
var stopped_code_execution = false

# level completion variables
onready var steps = $CanvasLayer/LevelCompletePopup.get_node("LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Steps/step_count")
onready var collisions = $CanvasLayer/LevelCompletePopup.get_node("LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Collisions/collision_count")
onready var codeblocks = $CanvasLayer/LevelCompletePopup.get_node("LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Code Blocks/codeblock_count")
onready var score = $CanvasLayer/LevelCompletePopup.get_node("LevelPopup/Title/Tutorial")

# Runs on load
func _ready() -> void:
	panel_to_drop_code_blocks.connect("notify_sprite", player, "_on_RunCodeButton_move_sprite")
	panel_to_drop_code_blocks.connect("notify_sprite", self, "calculate_no_of_code_blocks")
	side_panel.trash_bin.connect("discarded_code_block", panel_to_drop_code_blocks, "delete_space_which_discarded_block_originated")
	side_panel.connect("pressed_reset_button", player, "reset_sprite_position")
	side_panel.connect("pressed_reset_button", level, "reset_keys")
	side_panel.connect("pressed_reset_button", end_goal, "turn_off_monitoring")
	side_panel.connect("pressed_reset_button", player, "unterminate")
	side_panel.connect("pressed_reset_button", self, "on_reset_stopped_code_execution")
	
	side_panel.connect("pressed_stop_button", player, "terminate")
	side_panel.connect("pressed_stop_button", self, "on_stopped_code_execution")
	
	side_panel.connect("pressed_back_button", self, "show_quit_dialog")
	quit_level_pop_up.connect("quit_level", self, "go_back_to_level_selection")
	
	side_panel.speed_button.connect("toggled_speed_button", player, "toggle_speed")
	
	level_complete_pop_up.connect("pressed_level_selection_button", self, "go_back_to_level_selection")
	level_complete_pop_up.connect("pressed_restart_button", self, "restart_level")
	level_complete_pop_up.connect("pressed_next_button", self, "go_to_next_level")

	
	# After executing code, end goal will turn on it's monitoring and check if player is on end goal
	# If player would to reach end goal without finishing executing code, nothing will happen
	player.connect("finished_executing_code", self, "on_finished_executing_code")
	end_goal.connect("player_reached_end_goal", self, "on_player_reached_end_goal")
	connect("statistics_ready", Backend, "upload_statistics")
	
	# Hides the Level Completion Popup initially
	$CanvasLayer/LevelCompletePopup.visible = false

# Stops code execution
func on_stopped_code_execution():
	stopped_code_execution = true
	print("stopped_code_execution: " + str(stopped_code_execution))

# Resets code execution
func on_reset_stopped_code_execution():
	stopped_code_execution = false
	print("stopped_code_execution: " + str(stopped_code_execution))

# Checks if input is R. If so, reset.
# For debugging purposes.
func _input(event) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_R:
			reset_level()

# Resets everything (player position, code blocks, gold)
func reset_level():
	get_tree().reload_current_scene()

# Gets the number of code blocks used
func calculate_no_of_code_blocks(list_of_instructions):
	no_of_code_blocks = panel_to_drop_code_blocks.count_code_blocks()

# Triggers when end goal is reached
func on_player_reached_end_goal() -> void:
	if level.there_is_no_key_left() and !stopped_code_execution:
		AudioManager.play_sfx("PassLevel")
		var no_of_collisions = level_statistics[0]
		var no_of_steps = level_statistics[1]
		level_statistics.append(no_of_code_blocks)
		# End goal statistics
		emit_signal("statistics_ready", level_statistics)
		# The code for the pop up appearing needs to be here to congratulate player
		$CanvasLayer/LevelCompletePopup/LevelPopup.popup_centered()
		# test if this is displaying
		collisions.text = str(no_of_collisions)
		steps.text = str(no_of_steps)
		codeblocks.text = str(no_of_code_blocks)
		score.text = "Score: "+ str(50000 - (no_of_code_blocks * 1000 + no_of_steps * 500 + no_of_collisions * 250))
		level_complete_pop_up.set_stars(level_statistics)
	elif !level.there_is_no_key_left() and !stopped_code_execution:
		AudioManager.play_sfx("FailLevel")
		# The code for the pop up appearing needs to be here to tell player they failed lvl

# Triggers when code finishes executing
func on_finished_executing_code(statistics) -> void:
	end_goal.turn_on_monitoring()
	side_panel.enable_reset_button()
	update_statistics(statistics)

# Updates statistics
func update_statistics(statistics):
	level_statistics = statistics

# Restarts level
func restart_level():
	reset_level()

# Goes back to level selection
func go_back_to_level_selection():
	AudioManager.play_music("Music1")
	get_tree().change_scene("res://DungeonCrawler/UI/LevelSelection/LevelSelection.tscn")

# Goes to next level
func go_to_next_level():
	if next_level != null:
		Backend.level += 1
		get_tree().change_scene_to(next_level)
	
# Shows quit dialog
func show_quit_dialog():
	quit_level_pop_up.confirmation_dialog.popup_centered()
