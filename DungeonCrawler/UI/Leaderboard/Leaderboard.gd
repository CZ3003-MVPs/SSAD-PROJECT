extends Control

var scene_path_to_load 
onready var column : VBoxContainer = $Leaderboard/VBoxContainer
onready var dropdown : OptionButton = $LevelContainer/LevelSelector
export var score_row : PackedScene = preload("res://DungeonCrawler/UI/Leaderboard/ScoreRow.tscn")
export var title_row : PackedScene = preload("res://DungeonCrawler/UI/Leaderboard/TitleRow.tscn")
signal leaderboard
signal get_levels_list

# Loads on startup
# Default leaderboard will be retrieved
func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	
	connect("leaderboard", Backend, "get_leaderboard")
	connect("levels_list", Backend, "add_dropdown_options")
	Backend.connect("show_leaderboard", self, "refresh_leaderboard")
	Backend.connect("get_levels_list", self, "get_levels")
	
	add_title_row()
	get_leaderboard("All")
	emit_signal("get_levels_list")
	
	#$Leaderboard.get_v_scrollbar().modulate = Color(0, 0, 0, 0)

# Signal after back button pressed
# User will be redirected to main menu
func _on_BackButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after button pressed
# User will be redirected to corresponding scene
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

# Signal after item select
# Leaderboard will be retrieved accordingly
func _on_LevelSelector_item_selected(index):
	get_leaderboard(dropdown.get_item_text(index))

# Clears current leaderboard
func delete_current_rows() -> void:
	for child in column.get_children():
		if child is ScoreRow:
			child.queue_free()

# Adds row to leaderboard
func add_new_rows(users: Array) -> void:
	for user in users:
		var new_score_row := score_row.instance() as ScoreRow
		column.add_child(new_score_row)
		new_score_row.username.text = user.doc_fields.username
		new_score_row.score.text = str(user.doc_fields.scores.values()[0].score)

# Gets entire leaderboard
func get_leaderboard(level):
	var score_field = "scores.level" + level + ".score"
	if level == "All":
		score_field = "scores.total.score"
	emit_signal("leaderboard", score_field)

func refresh_leaderboard(result):
	delete_current_rows()
	add_new_rows(result)

# Add the top row of leaderboard
func add_title_row():
	var new_title_row := title_row.instance() as TitleRow
	column.add_child(new_title_row)
	new_title_row.username.text = "Name"
	new_title_row.score.text = "Score"

# Add leaderboard display options
func add_dropdown_options(max_level):
	dropdown.add_item("All")
	dropdown.add_separator()
	
	for i in range(1, max_level + 1):
		dropdown.add_item(str(i))
	dropdown.make_option_button_items_non_radio_checkable()
