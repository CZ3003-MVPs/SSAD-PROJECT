extends Control
var scene_path_to_load

onready var password : LineEdit = $ChangePasswordBox/NewPassword/LineEdit
onready var confirm_password : LineEdit = $ChangePasswordBox/NewPasswordReconfirmation/LineEdit
onready var notification : Label = $NotificationLabel

# Loads on startup
func _ready():
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	
	$ChangePwConfirmation.visible = false
	$SuccessNotification.visible = false
	
	# Change password confirmation dialog
	$ChangePwConfirmation.get_ok().text = "Yes"
	$ChangePwConfirmation.get_cancel().text = "No"
	
# Signal after back button pressed
# User will be redirected to previous page
func _on_BackButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Settings/Settings.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

# Triggers when submit button is pressed
func _on_SubmitButton_pressed():
	if password.text != confirm_password.text:
		notification.text = "Password don't match!"
		return
	if password.text.empty():
		notification.text = "Please fill in all fields!"
		return
	if password.text.length() < 6:
		notification.text = "Password must have at least 6 characters!"
		return
	$ChangePwConfirmation.visible = true

# Changes user password
func _on_ChangePwConfirmation_confirmed():
	Firebase.Auth.change_user_password(password.text)
	$ChangePwConfirmation.visible = false
	$SuccessNotification.visible = true

# Redirects back to main menu
func _on_SuccessNotification_confirmed():
	scene_path_to_load = "res://DungeonCrawler/UI/MenuPage/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 
