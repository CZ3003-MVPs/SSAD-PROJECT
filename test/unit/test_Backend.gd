extends "res://addons/gut/test.gd"

var Backend = load("res://static/Backend.gd")

func before_each():
	gut.p("ran setup", 2)

func test_set_user_info():
	var _backend = Backend.new()
	_backend.set_user_info({"idtoken": "12345",
		"localid": "54321"})
	assert_eq_deep(_backend.user_info, {"token": "12345", "id": "54321"})

func after_each():
	gut.p("ran teardown", 2)

func before_all():
	gut.p("ran run setup", 2)

func after_all():
	gut.p("ran run teardown", 2)
