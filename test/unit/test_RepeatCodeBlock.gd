extends "res://addons/gut/test.gd"

var RepeatCodeBlock = load("res://DungeonCrawler/CodeBlocks/RepeatCodeBlock.tscn")
var _repeatCodeBlock = null

func before_each():
	_repeatCodeBlock = RepeatCodeBlock.instance()

func after_each():
	_repeatCodeBlock.free()

func test_get_instruction():
	add_child_autofree(_repeatCodeBlock)
	var replace_label = Label.new()
	replace_node(_repeatCodeBlock, 'Label', replace_label)
	assert_typeof(_repeatCodeBlock.get_instruction(), TYPE_ARRAY)
	replace_label.free()
