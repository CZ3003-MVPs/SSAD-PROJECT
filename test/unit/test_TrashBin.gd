extends "res://addons/gut/test.gd"

var SpeedButton = load("res://DungeonCrawler/CodeBlocks/Panels/SidePanel/TrashBin.gd")
var _SpeedButton = null

func before_each():
	_SpeedButton = SpeedButton.new()
	_SpeedButton._ready()

func after_each():
	_SpeedButton.free()
	
func test_can_drop_data():
	assert_true(_SpeedButton.can_drop_data(null, {"space_index": null}))
	assert_false(_SpeedButton.can_drop_data(null, {"nothing": null}))
