extends Control

onready var email : LineEdit = $RegisterBox/EmailBox/LineEdit
onready var username : LineEdit = $RegisterBox/DisplayNameBox/LineEdit
onready var password : LineEdit = $RegisterBox/PasswordBox/LineEdit
onready var confirm : LineEdit = $RegisterBox/ConfirmPasswordBox/LineEdit
onready var notification : Label = $Notification

var scene_path_to_load

# Loads on startup
# Email will be on focus
func _ready():
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_register_succeeded")
	Firebase.Auth.connect("signup_failed", self, "on_signup_failed")
	email.grab_focus() # adding keyboard support (set focus on the email line edit)

# Signal after pressing register button
func _on_RegisterButton_pressed() -> void:
    if username.text.empty():
        notification.text = "Please fill up username!"
        return

	if password.text != confirm.text or email.text.empty() or password.text.empty():
		notification.text = "Invalid email/password!"
		return

	Firebase.Auth.signup_with_email_and_password(email.text, password.text)

# Signal after successful registration
# User will be redirected to login page
func _on_FirebaseAuth_register_succeeded(auth):
	Backend.create_document(auth, username.text)
	notification.text = "Registration sucessful! Redirecting you to login page..."
	yield(get_tree().create_timer(2.0), "timeout")
	scene_path_to_load = "res://DungeonCrawler/UI/Login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after failed registration
# User will show a notification text on failure
func on_signup_failed(error_code, message):
	notification.text = message.capitalize()

# Signal after back button pressed
# User will be redirected to login screen
func _on_BackButton_pressed():
	scene_path_to_load = "res://DungeonCrawler/UI/Login/Login.tscn"
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
