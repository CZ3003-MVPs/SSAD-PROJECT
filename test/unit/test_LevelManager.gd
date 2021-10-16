extends "res://addons/gut/test.gd"

var LevelManager = load("res://DungeonCrawler/Levels/LevelManager.gd")
var _levelManager = null

func before_each():
	_levelManager = LevelManager.new()

func after_each():
	_levelManager.free()

func test__input():
	_levelManager._input(null)
	pass_test("Test passed!")
	
func test_update_statistics():
	_levelManager.update_statistics([])
	assert_eq_deep(_levelManager.level_statistics, [])

	_levelManager.update_statistics([1, 2, 3])
	assert_eq_deep(_levelManager.level_statistics, [1, 2, 3])
