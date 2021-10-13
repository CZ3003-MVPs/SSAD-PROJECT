extends Control

var scene_path_to_load


func _ready():
	$SuccessNotification.visible = false

# Signal after back button pressed
# User will be redirected to previous page
func _on_BackButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 


func _on_SubmitButton_pressed():
	$SuccessNotification.visible = true

func _on_SuccessNotification_confirmed():
	scene_path_to_load = "res://DungeonCrawler/UI/Login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 


# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
