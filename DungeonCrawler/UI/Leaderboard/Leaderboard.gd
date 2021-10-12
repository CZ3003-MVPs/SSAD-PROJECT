extends Control

var scene_path_to_load 
onready var column : VBoxContainer = $Leaderboard
onready var dropdown : OptionButton = $LevelContainer/LevelSelector
export var score_row : PackedScene = preload("res://DungeonCrawler/UI/Leaderboard/ScoreRow.tscn")
export var title_row : PackedScene = preload("res://DungeonCrawler/UI/Leaderboard/TitleRow.tscn")

# Loads on startup
# Default leaderboard will be retrieved
func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	
	add_title_row()
	get_leaderboard("All")
	add_dropdown_options()

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
		new_score_row.score.text = str(user.doc_fields.scores.values()[0])

# Gets entire leaderboard
func get_leaderboard(level):
	var score_field = "scores.level" + level
	if level == "All":
		score_field = "scores.total"
	var query : FirestoreQuery = FirestoreQuery.new()
	query.select(["username", score_field])
	query.from("users")
	query.order_by(score_field, FirestoreQuery.DIRECTION.DESCENDING)
	query.limit(10)
	var query_task : FirestoreTask = Firebase.Firestore.query(query)
	var result = yield(query_task, "task_finished")
	delete_current_rows()
	add_new_rows(result)

# Add the top row of leaderboard
func add_title_row():
	var new_title_row := title_row.instance() as TitleRow
	column.add_child(new_title_row)
	new_title_row.username.text = "Name"
	new_title_row.score.text = "Score"

# Add leaderboard display options
func add_dropdown_options():
	var query : FirestoreQuery = FirestoreQuery.new()
	query.select(["username", "scores"])
	query.from("users")
	var query_task : FirestoreTask = Firebase.Firestore.query(query)
	var result = yield(query_task, "task_finished")
	
	var max_level = 0
	
	for user in result:
		for key in user.doc_fields.scores.keys():
			if (key != "total"):
				max_level = max(int(key.replace("level", "")), max_level)
	
	dropdown.add_item("All")
	dropdown.add_separator()
	
	for i in range(1, max_level + 1):
		dropdown.add_item(str(i))
	dropdown.make_option_button_items_non_radio_checkable()
