extends "res://addons/gut/test.gd"

var IndentedSpaceToDropCodeBlock = load("res://DungeonCrawler/CodeBlocks/Panels/Spaces/IndentedSpaceToDropCodeBlock.tscn")
var _indentedSpaceToDropCodeBlock = null

func before_each():
	_indentedSpaceToDropCodeBlock = IndentedSpaceToDropCodeBlock.instance()

func after_each():
	_indentedSpaceToDropCodeBlock.free()

func test_can_drop_data():
	assert_true(_indentedSpaceToDropCodeBlock.can_drop_data(null, {"block_to_spawn": null}))
	assert_false(_indentedSpaceToDropCodeBlock.can_drop_data(null, {"block": null}))
