extends "res://addons/gut/test.gd"

var CollectCodeBlock = load("res://DungeonCrawler/CodeBlocks/CollectCodeBlock.tscn")
var _collectCodeBlock = null

func before_each():
	_collectCodeBlock = CollectCodeBlock.instance()

func after_each():
	_collectCodeBlock.free()

func test_get_instruction():
	add_child_autofree(_collectCodeBlock)
	var replace_label = Label.new()
	replace_node(_collectCodeBlock, 'Label', replace_label)
	assert_typeof(_collectCodeBlock.get_instruction(), TYPE_ARRAY)
	replace_label.free()
