extends "res://addons/gut/test.gd"

var Backend = load("res://static/Backend.gd")
var _backend = null

func before_each():
	_backend = Backend.new()

func after_each():
	_backend.free()
	
