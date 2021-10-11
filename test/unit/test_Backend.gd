extends "res://addons/gut/test.gd"

var Backend = load("res://static/Backend.gd")
var _backend = null

func before_each():
	_backend = Backend.new()

func after_each():
	_backend.free()

func test_set_user_info():
	_backend.set_user_info({"idtoken": "12345",
		"localid": "54321"})
	assert_eq_deep(_backend.user_info, {"token": "12345", "id": "54321"})
