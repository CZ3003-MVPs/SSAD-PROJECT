extends "res://addons/gut/test.gd"

var WalkCodeBlock = load("res://DungeonCrawler/CodeBlocks/WalkCodeBlock.tscn")
var _walkCodeBlock = null

func before_each():
	_walkCodeBlock = WalkCodeBlock.instance()

func after_each():
	_walkCodeBlock.free()

func test_get_instruction():
	add_child_autofree(_walkCodeBlock)
	var replace_label = Label.new()
	replace_node(_walkCodeBlock, 'Label', replace_label)
	assert_typeof(_walkCodeBlock.get_instruction(), TYPE_ARRAY)
	replace_label.free()
