extends Control

var scene_path_to_load 
onready var column : VBoxContainer = $Leaderboard
onready var dropdown : OptionButton = $LevelContainer/LevelSelector
export var score_row : PackedScene = preload("res://DungeonCrawler/UI/Leaderboard/ScoreRow.tscn")
export var title_row : PackedScene = preload("res://DungeonCrawler/UI/Leaderboard/TitleRow.tscn")

func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	
	add_title_row()
	get_leaderboard("All")
	add_dropdown_options()

func _on_BackButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

func _on_LevelSelector_item_selected(index):
	get_leaderboard(dropdown.get_item_text(index))

func delete_current_rows() -> void:
	for child in column.get_children():
		if child is ScoreRow:
			child.queue_free()

func add_new_rows(users: Array) -> void:
	for user in users:
		var new_score_row := score_row.instance() as ScoreRow
		column.add_child(new_score_row)
		new_score_row.username.text = user.doc_fields.username
		new_score_row.score.text = str(user.doc_fields.scores.values()[0])

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

func add_title_row():
	var new_title_row := title_row.instance() as TitleRow
	column.add_child(new_title_row)
	new_title_row.username.text = "Name"
	new_title_row.score.text = "Score"

func add_dropdown_options():
	
	dropdown.add_item("All")
	dropdown.add_separator()
	dropdown.add_item("1")
	dropdown.add_item("2")
	
	var query : FirestoreQuery = FirestoreQuery.new()
	query.select(["username", "scores"])
	query.from("users")
	var query_task : FirestoreTask = Firebase.Firestore.query(query)
	var result = yield(query_task, "task_finished")
	
	var rows = {}
	
	for user in result:
		for key in user.doc_fields.scores.keys():
			rows[key] = null
	
	print(rows.keys())
