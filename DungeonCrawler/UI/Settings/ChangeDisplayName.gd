extends Control

onready var username : LineEdit = $ChangeDisplayNameBox/NewDisplayName/LineEdit
var scene_path_to_load

# Loads on startup
func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	

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
		# show notification error
		return
	Backend.change_display_name(username.text)
	# show notification
	yield(get_tree().create_timer(1.0), "timeout")
	scene_path_to_load = "res://DungeonCrawler/UI/Settings/Settings.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 
