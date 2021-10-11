extends "res://addons/gut/test.gd"

var RunCodeButton = load("res://DungeonCrawler/CodeBlocks/Panels/SidePanel/RunCodeButton.gd")
var _runCodeButton = null

func before_each():
	_runCodeButton = RunCodeButton.new()

func after_each():
	_runCodeButton.free()

func test_runCodeButton_pressed():
	watch_signals(_runCodeButton)
	_runCodeButton._on_RunCodeButton_pressed()
	assert_signal_emitted(_runCodeButton, "pressed_run_code")
	assert_true(_runCodeButton.disabled)
