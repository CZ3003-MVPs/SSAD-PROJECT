extends Control

signal clear_user

# Loads on startup
func _ready():
	connect("clear_user", Backend, "clear_user_info")

# Clears user from client, and logs out
func _on_LogoutConfirmationDialog_confirmed():
	emit_signal("clear_user")
	get_tree().change_scene("res://DungeonCrawler/UI/Login/Login.tscn")
