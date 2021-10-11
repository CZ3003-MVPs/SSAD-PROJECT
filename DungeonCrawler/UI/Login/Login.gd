extends Control

onready var email : LineEdit = $LoginBox/EmailBox/LineEdit
onready var password : LineEdit = $LoginBox/PasswordBox/LineEdit
onready var notification : Label = $Notification

var scene_path_to_load

func _ready() -> void:
	Firebase.Auth.connect("login_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("login_failed", self, "on_login_failed")
	email.grab_focus() # adding keyboard support (set focus on the email line edit)

func _on_LoginButton_pressed() -> void:
	if email.text.empty() or password.text.empty():
		notification.text = "Enter your email and password!"
		return
	Firebase.Auth.login_with_email_and_password(email.text, password.text)

func _on_RegisterButton_pressed() -> void:
	scene_path_to_load = "res://DungeonCrawler/UI/Register/Register.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_FirebaseAuth_login_succeeded(auth):
	Backend.set_user_info(auth)
	notification.text = "Login Successful!"
	yield(get_tree().create_timer(1.0), "timeout")
	scene_path_to_load = "res://DungeonCrawler/UI/MenuPage/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 
	
func on_login_failed(error_code, message):
	notification.text = message.capitalize()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
