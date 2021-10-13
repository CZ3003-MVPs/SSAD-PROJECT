extends Control

onready var username : LineEdit = $ChangeDisplayNameBox/NewDisplayName/LineEdit
var scene_path_to_load

# Loads on startup
func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	
	# Hides the success notification initially 
	$SuccessNotification.visible = false

func _on_BackButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Settings/Settings.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)


func _on_SubmitButton_pressed():
	if username.text.empty():
		return
	Backend.change_display_name(username.text)
	$SuccessNotification.visible = true


func _on_SuccessNotification_confirmed():
	scene_path_to_load = "res://DungeonCrawler/UI/MenuPage/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

