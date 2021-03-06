extends Control

onready var email : LineEdit = $LoginBox/EmailBox/LineEdit
onready var password : LineEdit = $LoginBox/PasswordBox/LineEdit
onready var notification : Label = $Notification

var scene_path_to_load

signal set_user

# Loads on startup
# Email will be on focus
func _ready() -> void:
	Firebase.Auth.connect("login_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("login_failed", self, "on_login_failed")
	
	connect("set_user", Backend, "set_user_info")
	
	# adding keyboard support (set focus on the email line edit)
	email.grab_focus() 
	AudioManager.play_music("Music1")
	
# Signal after pressing login button
func _on_LoginButton_pressed() -> void:
	if email.text.empty() or password.text.empty():
		notification.text = "Enter your email and password!"
		return
	Firebase.Auth.login_with_email_and_password(email.text, password.text)

# Signal after pressing register button
# User will be redirected to register page
func _on_RegisterButton_pressed() -> void:
	scene_path_to_load = "res://DungeonCrawler/UI/Register/Register.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after successful login
# User will be redirected to main menu
func _on_FirebaseAuth_login_succeeded(auth):
	emit_signal("set_user", auth)

	notification.text = "Login Successful!"
	yield(get_tree().create_timer(1.0), "timeout")
	scene_path_to_load = "res://DungeonCrawler/UI/MenuPage/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after failed login
# User will be shown the error
func on_login_failed(_error_code, message):
	notification.text = message.capitalize()

# Signal after pressing forgot password
# User will be redirected to reset password page
func _on_ForgetPasswordButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Login/ForgetPassword.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 


# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)



