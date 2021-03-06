extends Control

onready var username : LineEdit = $ChangeDisplayNameBox/NewDisplayName/LineEdit
onready var current_username : Label = $ChangeDisplayNameBox/CurrentDisplayName/DisplayName
onready var notification : Label = $Notification
var scene_path_to_load

# Loads on startup
func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	
	Backend.connect("display_username", self, "show_current_username")	
	
	# Hides the success notification initially 
	$SuccessNotification.visible = false
	
	Backend.get_display_name()

# Redirects back to setting page
func _on_BackButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Settings/Settings.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

# Shows current display name
func show_current_username(db_username):
	current_username.text = db_username

# Triggers when submit button is pressed
func _on_SubmitButton_pressed():
	if username.text.empty():
		notification.text = "Name cannot be empty!"
		return
		
	if username.text == current_username.text:
		notification.text = "Name cannot be the same as before!"
		return
	
	Backend.change_display_name(username.text)
	$SuccessNotification.visible = true

# Redirects user back to main menu
func _on_SuccessNotification_confirmed():
	scene_path_to_load = "res://DungeonCrawler/UI/MenuPage/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

