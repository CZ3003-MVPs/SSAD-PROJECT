extends "res://addons/gut/test.gd"

var Register = load("res://DungeonCrawler/UI/Register/Register.tscn")
var _register = null

func before_each():
	_register = Register.instance()

func after_each():
	_register.free()

func test__ready():
	watch_signals(_register)
	_register._ready()
	assert_connected(Firebase.Auth, _register, "signup_succeeded")
	assert_connected(Firebase.Auth, _register, "signup_failed")
