extends "res://addons/gut/test.gd"

var IfCodeBlock = load("res://DungeonCrawler/CodeBlocks/IfCodeBlock.tscn")
var _ifCodeBlock = null

func before_each():
	_ifCodeBlock = IfCodeBlock.instance()

func after_each():
	_ifCodeBlock.free()

func test_get_instruction():
	add_child_autofree(_ifCodeBlock)
	var replace_label = Label.new()
	replace_node(_ifCodeBlock, 'Label', replace_label)
	assert_typeof(_ifCodeBlock.get_instruction(), TYPE_ARRAY)
	replace_label.free()
