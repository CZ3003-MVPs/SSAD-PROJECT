extends "res://addons/gut/test.gd"

var SidePanel = load("res://DungeonCrawler/CodeBlocks/Panels/SidePanel/SidePanel.tscn")
var _sidePanel = null

func before_each():
	_sidePanel = SidePanel.instance()
	_sidePanel._ready()

func after_each():
	_sidePanel.free()

func test__ready():
	assert_connected(_sidePanel.run_code_button, _sidePanel.panel_to_drop_code_blocks, "pressed_run_code")
	
func test__on_ResetButton_pressed():
	watch_signals(_sidePanel)
	_sidePanel._on_ResetButton_pressed()
	assert_signal_emitted(_sidePanel, "pressed_reset_button")
	assert_false(_sidePanel.run_code_button.disabled)
	assert_true(_sidePanel.reset_button.disabled)
	
func test_enable_reset_button():
	assert_false(_sidePanel.reset_button.disabled)
