extends "res://addons/gut/test.gd"

var AreaToCollect = load("res://DungeonCrawler/Player/AreaToCollect.gd")
var _areaToCollect = null

func before_each():
	_areaToCollect = AreaToCollect.new()

func after_each():
	_areaToCollect.free()

func test__on_Timer_timeout():
	_areaToCollect._on_Timer_timeout()
	assert_false(_areaToCollect.monitoring)
