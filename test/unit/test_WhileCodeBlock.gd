extends "res://addons/gut/test.gd"

var WhileCodeBlock = load("res://DungeonCrawler/CodeBlocks/WhileCodeBlock.tscn")
var _whileCodeBlock = null

func before_each():
	_whileCodeBlock = WhileCodeBlock.instance()

func after_each():
	_whileCodeBlock.free()

func test_get_instruction():
	add_child_autofree(_whileCodeBlock)
	var replace_label = Label.new()
	replace_node(_whileCodeBlock, 'Label', replace_label)
	assert_typeof(_whileCodeBlock.get_instruction(), TYPE_ARRAY)
	replace_label.free()
