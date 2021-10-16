extends "res://addons/gut/test.gd"

var SpeedButton = load("res://DungeonCrawler/CodeBlocks/Panels/SidePanel/SpeedButton.gd")
var _SpeedButton = null

func before_each():
	_SpeedButton = SpeedButton.new()
	_SpeedButton._ready()

func after_each():
	_SpeedButton.free()

func test__ready():
	pass_test("Test passed!")
	
func test__on_SpeedButton_pressed():
	watch_signals(_SpeedButton)
	_SpeedButton._on_SpeedButton_pressed()
	assert_signal_emitted(_SpeedButton, "toggled_speed_button")
