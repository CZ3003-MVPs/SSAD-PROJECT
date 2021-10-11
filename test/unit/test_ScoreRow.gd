extends "res://addons/gut/test.gd"

var ScoreRow = load("res://DungeonCrawler/UI/Leaderboard/ScoreRow.tscn")
var _scoreRow = null

func before_each():
	_scoreRow = ScoreRow.instance()

func after_each():
	_scoreRow.free()

func test__ready():
	_scoreRow._ready()
	pass_test("Test passed!")
