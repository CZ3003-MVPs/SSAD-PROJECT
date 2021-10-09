extends Control

var scene_path_to_load 

func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	var query : FirestoreQuery = FirestoreQuery.new()
	query.select(["username", "scores.level1"])
	query.from("users")
	query.order_by("scores.level1", FirestoreQuery.DIRECTION.DESCENDING)
	query.limit(10)
	var query_task : FirestoreTask = Firebase.Firestore.query(query)
	var result = yield(query_task, "task_finished")
	print(result)

func _on_BackButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)


func add_new_rows():
	pass
