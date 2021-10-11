extends Control

var scene_path_to_load 

# Loads on startup
func _ready():
		
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	

# Signal after back button pressed
# User will be redirected to previous page
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

	




func _on_RegisterButton_pressed():
	pass # Replace with function body.
