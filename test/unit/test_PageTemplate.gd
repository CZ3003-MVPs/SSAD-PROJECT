extends "res://addons/gut/test.gd"

var PageTemplate = load("res://DungeonCrawler/UI/PageTemplate.tscn")
var _pageTemplate = null

func before_each():
	_pageTemplate = PageTemplate.instance()

func after_each():
	_pageTemplate.free()

func test__on_BackButton_pressed():
	_pageTemplate._on_BackButton_pressed()
	pass_test("Test passed!")
