extends "res://addons/gut/test.gd"

var RunCodeButton = load('res://DungeonCrawler/CodeBlocks/Panels/SidePanel/RunCodeButton.gd')

func before_each():
	gut.p("ran setup", 2)

func test_runCodeButton_pressed():
	var _runCodeButton = RunCodeButton.new()
	watch_signals(_runCodeButton)
	_runCodeButton._on_RunCodeButton_pressed()
	assert_signal_emitted(_runCodeButton, "pressed_run_code")
	assert_true(_runCodeButton.disabled)
	
	#func _on_RunCodeButton_pressed():
	#emit_signal("pressed_run_code")
	#disabled = true

func after_each():
	gut.p("ran teardown", 2)

func before_all():
	gut.p("ran run setup", 2)

func after_all():
	gut.p("ran run teardown", 2)
