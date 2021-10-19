extends "res://addons/gut/test.gd"

func test_registration():
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_register_succeeded")
	
	watch_signals(Firebase.Auth)
	
	var email = "firebase_unit_testing@gmail.com"
	var password = "P@ssw0rd"
	Firebase.Auth.signup_with_email_and_password(email, password)
	
	assert_signal_emitted(Firebase.Auth, "signup_succeeded")

func _on_FirebaseAuth_register_succeeded():
	print("reg test")
