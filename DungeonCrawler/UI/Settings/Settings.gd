extends Control

var scene_path_to_load

func _ready():
	$ChangePwConfirmation.visible = false
	$SuccessNotification.visible = false
	
	# Change password confirmation dialog
	$ChangePwConfirmation.get_ok().text = "Yes"
	$ChangePwConfirmation.get_cancel().text = "No"
	

func _on_ChangePasswordButton_pressed():
	$ChangePwConfirmation.visible = true

func _on_ChangePwConfirmation_confirmed():
	# Backend codes here
	# Show email is sent notification 
	$ChangePwConfirmation.visible = false
	$SuccessNotification.visible = true

func _on_SuccessNotification_confirmed():
	scene_path_to_load = "res://DungeonCrawler/UI/MenuPage/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 
	
func _on_ChangeDisplayNameButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Settings/ChangeDisplayName.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 
	
func _on_BackButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/MenuPage/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 


# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)


