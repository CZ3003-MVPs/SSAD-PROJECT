extends "res://addons/gut/test.gd"

var Login = load("res://DungeonCrawler/UI/Login/Login.tscn")
var _login = null

func before_each():
	_login = Login.instance()

func after_each():
	_login.free()

func test__ready():
	watch_signals(_login)
	_login._ready()
	assert_connected(Firebase.Auth, _login, "login_succeeded")
	assert_connected(Firebase.Auth, _login, "login_failed")
