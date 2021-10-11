extends "res://addons/gut/test.gd"

var ElseCodeBlock = load("res://DungeonCrawler/CodeBlocks/ElseCodeBlock.tscn")
var _elseCodeBlock = null

func before_each():
	_elseCodeBlock = ElseCodeBlock.instance()

func after_each():
	_elseCodeBlock.free()

func test_get_instruction():
	add_child_autofree(_elseCodeBlock)
	var replace_label = Label.new()
	replace_node(_elseCodeBlock, 'Label', replace_label)
	assert_typeof(_elseCodeBlock.get_instruction(), TYPE_ARRAY)
	replace_label.free()
