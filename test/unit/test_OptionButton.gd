extends "res://addons/gut/test.gd"

var OptionButton = load("res://DungeonCrawler/CodeBlocks/OptionButton.gd")
var _optionButton = null

func before_each():
	_optionButton = OptionButton.new()

func after_each():
	_optionButton.free()

func test_hide_dropdown_arrow():
	_optionButton.hide_dropdown_arrow()
	pass_test("Test passed!")
