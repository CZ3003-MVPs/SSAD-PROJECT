extends Control

signal clear_user

func _ready():
	connect("clear_user", Backend, "clear_user_info")

func _on_LogoutConfirmationDialog_confirmed():
	emit_signal("clear_user")
	get_tree().change_scene("res://DungeonCrawler/UI/Login/Login.tscn")
