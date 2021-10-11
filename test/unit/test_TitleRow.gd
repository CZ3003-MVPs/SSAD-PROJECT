extends "res://addons/gut/test.gd"

var TitleRow = load("res://DungeonCrawler/UI/Leaderboard/TitleRow.tscn")
var _titleRow = null

func before_each():
	_titleRow = TitleRow.instance()

func after_each():
	_titleRow.free()

func test__ready():
	_titleRow._ready()
	pass_test("Test passed!")
