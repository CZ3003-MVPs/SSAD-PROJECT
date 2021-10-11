extends Control

var scene_path_to_load 

# Loads on startup
# Levels will be locked accordingly
func _ready():
	# Backend
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(Backend.user_info.id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	
	var max_level = 0
	
	for key in document.doc_fields.scores.keys():
		if (key != "total"):
			max_level = max(int(key.replace("level", "")), max_level)

	max_level += 1

	for level in $Levels.get_children():
		if int(level.name) <= max_level:
			level.set_disabled(false)
			
		else:
			level.set_disabled(true)
			level.set_normal_texture(load("res://assets/level selection/locked_level.png"))
			
		level.connect("pressed", self, "_on_Button_pressed", [level.scene_to_load])
		
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	

# Signal after back button pressed
# User will be redirected to main menu
func _on_BackButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

	


