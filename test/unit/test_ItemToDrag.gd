extends "res://addons/gut/test.gd"

var ItemToDrag = load("res://DungeonCrawler/CodeBlocks/Test/Tutorial/ItemToDrag.tscn")
var _itemToDrag = null

func before_each():
	_itemToDrag = ItemToDrag.instance()

func after_each():
	_itemToDrag.free()

func test_can_drop_data():
	assert_true(_itemToDrag.can_drop_data(null, null))
	
func test_drop_data():
	_itemToDrag.drop_data(null, null)
	pass_test("Test passed!")
