extends "res://addons/gut/test.gd"

var SpaceToDropCodeBlock = load("res://DungeonCrawler/CodeBlocks/Panels/Spaces/SpaceToDropCodeBlock.tscn")
var _spaceToDropCodeBlock = null

func before_each():
	_spaceToDropCodeBlock = SpaceToDropCodeBlock.instance()

func after_each():
	_spaceToDropCodeBlock.free()

func test_can_drop_data():
	assert_true(_spaceToDropCodeBlock.can_drop_data(null, {"block_to_spawn": null}))
	
func test_increase_rect_min_size():
	_spaceToDropCodeBlock.increase_rect_min_size(true)
	pass_test("Test passed")
	
func test_decrease_rect_min_size():
	_spaceToDropCodeBlock.decrease_rect_min_size(0.0)
	pass_test("Test passed")
