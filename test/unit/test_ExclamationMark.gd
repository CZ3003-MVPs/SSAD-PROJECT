extends "res://addons/gut/test.gd"

var ExclamationMark = load("res://DungeonCrawler/Player/ExclamationMark.gd")
var _exclamationMark = null

func before_each():
	_exclamationMark = ExclamationMark.new()

func after_each():
	_exclamationMark.free()

func test__on_Tween_tween_all_completed():
	_exclamationMark._on_Tween_tween_all_completed()
	assert_false(_exclamationMark.visible)
