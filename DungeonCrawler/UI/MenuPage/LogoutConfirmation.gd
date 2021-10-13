extends Control


func _on_LogoutConfirmationDialog_confirmed():
	get_tree().change_scene("res://DungeonCrawler/UI/Login/Login.tscn")
