extends "res://addons/gut/test.gd"

var PanelToDropItem = load("res://DungeonCrawler/CodeBlocks/Test/Tutorial/PanelToDropItem.tscn")
var _panelToDropItem = null

func before_each():
	_panelToDropItem = PanelToDropItem.instance()

func after_each():
	_panelToDropItem.free()

func test_can_drop_data():
	assert_true(_panelToDropItem.can_drop_data(null, null))
	