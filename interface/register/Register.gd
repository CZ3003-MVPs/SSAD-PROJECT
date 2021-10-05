extends Control

onready var email : LineEdit = $Container/RegisterBox/EmailBox/LineEdit
onready var password : LineEdit = $Container/RegisterBox/PasswordBox/LineEdit
onready var confirm : LineEdit = $Container/RegisterBox/ConfirmPasswordBox/LineEdit
onready var notification : Label = $Container/Notification

func _ready():
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("signup_failed", self, "on_signup_failed")

func _on_RegisterButton_pressed() -> void:
	if password.text != confirm.text or email.text.empty() or password.text.empty():
		notification.text = "Invalid email/password!"
		return
	#Firebase.register(email.text, password.text, http)
	Firebase.Auth.signup_with_email_and_password(email.text, password.text)

func _on_FirebaseAuth_login_succeeded(auth):
	notification.text = "Registration sucessful! Redirecting you to login page..."
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://interface/login/Login.tscn")

func on_signup_failed(error_code, message):
	notification.text = message.capitalize()
