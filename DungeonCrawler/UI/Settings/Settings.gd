extends Control

var scene_path_to_load

func _on_ChangePasswordButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Settings/ChangePassword.tscn"
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


