extends Control

onready var email : LineEdit = $RegisterBox/EmailBox/LineEdit
onready var password : LineEdit = $RegisterBox/PasswordBox/LineEdit
onready var confirm : LineEdit = $RegisterBox/ConfirmPasswordBox/LineEdit
onready var notification : Label = $Notification

var scene_path_to_load

func _ready():
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("signup_failed", self, "on_signup_failed")
	email.grab_focus() # adding keyboard support (set focus on the email line edit)

func _on_RegisterButton_pressed() -> void:
	if password.text != confirm.text or email.text.empty() or password.text.empty():
		notification.text = "Invalid email/password!"
		return
	#Firebase.register(email.text, password.text, http)
	Firebase.Auth.signup_with_email_and_password(email.text, password.text)

func _on_FirebaseAuth_login_succeeded(auth):
	notification.text = "Registration sucessful! Redirecting you to login page..."
	yield(get_tree().create_timer(2.0), "timeout")
	scene_path_to_load = "res://interface/login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

func on_signup_failed(error_code, message):
	notification.text = message.capitalize()

func _on_BackButton_pressed():
	scene_path_to_load = "res://interface/login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
