extends "res://addons/gut/test.gd"

var Background = load("res://DungeonCrawler/Levels/Background.gd")
var _background = null

func before_each():
	_background = Background.new()

func after_each():
	_background.free()

func test_can_drop_data():
	assert_true(_background.can_drop_data(null, {"space_index": null}))
	assert_false(_background.can_drop_data(null, {"space": null}))

func test_drop_data():
	watch_signals(_background)
	_background.drop_data(null, null)
	assert_signal_emitted(_background, "discarded_code_block")
