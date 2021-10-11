extends "res://addons/gut/test.gd"

var Backend = load("res://static/Backend.gd")

func test_set_user_info():
	var _backend = Backend.new()
	
	_backend.set_user_info({"idtoken": "12345",
		"localid": "54321"})
	assert_eq_deep(_backend.user_info, {"token": "12345", "id": "54321"})
	
	_backend.free()
