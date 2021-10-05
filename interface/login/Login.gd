extends Control

onready var email : LineEdit = $Container/LoginBox/EmailBox/LineEdit
onready var password : LineEdit = $Container/LoginBox/PasswordBox/LineEdit
onready var notification : Label = $Container/Notification

func _ready() -> void:
	Firebase.Auth.connect("login_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("login_failed", self, "on_login_failed")

func _on_LoginButton_pressed() -> void:
	if email.text.empty() or password.text.empty():
		notification.text = "Enter your email and password!"
		return
	Firebase.Auth.login_with_email_and_password(email.text, password.text)

func _on_RegisterButton_pressed() -> void:
	get_tree().change_scene("res://interface/register/Register.tscn")

func _on_FirebaseAuth_login_succeeded(auth):
	UserInfo.set_user_info(auth)
	notification.text = "Login Successful! Redirecting you in 2 seconds..."
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://interface/profile/UserProfile.tscn")
	
func on_login_failed(error_code, message):
	notification.text = message.capitalize()
