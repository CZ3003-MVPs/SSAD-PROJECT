extends Control

var scene_path_to_load
onready var email : LineEdit = $ResetPasswordBox/Email/LineEdit
onready var notification : Label = $Notification

func _ready():
	$SuccessNotification.visible = false

# Signal after back button pressed
# User will be redirected to previous page
func _on_BackButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_SubmitButton_pressed():
	if email.text.empty():
		notification.text = "Email cannot be empty!"
		return
	
	var arr = email.text.split("@")
	
	if arr.size() != 2 or arr[0].empty() or arr[1].empty() or arr[1].count(".") < 1 or arr[0].begins_with(".") or arr[0].ends_with(".") or arr[1].begins_with(".") or arr[1].ends_with("."):
		notification.text = "Invalid Email!"
		return
		
	Firebase.Auth.send_password_reset_email(email.text)
	$SuccessNotification.visible = true

func _on_SuccessNotification_confirmed():
	scene_path_to_load = "res://DungeonCrawler/UI/Login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 


# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
