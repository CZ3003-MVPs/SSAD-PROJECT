extends "res://addons/gut/test.gd"

var PanelToDropCodeBlocks = load("res://DungeonCrawler/CodeBlocks/Panels/SidePanel/PanelToDropCodeBlocks.tscn")
var _panelToDropCodeBlocks = null

func before_each():
	_panelToDropCodeBlocks = PanelToDropCodeBlocks.instance()
	_panelToDropCodeBlocks._ready()

func after_each():
	_panelToDropCodeBlocks.free()

func test__ready():
	assert_connected(_panelToDropCodeBlocks.spaces.get_child(0), _panelToDropCodeBlocks, "occupied_space")

func test_create_new_space():
	_panelToDropCodeBlocks.create_new_space()
	assert_connected(_panelToDropCodeBlocks.spaces.get_child(1), _panelToDropCodeBlocks, "occupied_space")

func test_delete_space_which_discarded_block_originated_1():
	_panelToDropCodeBlocks.delete_space_which_discarded_block_originated({"space_index":[0]})
	pass_test("Test passed!")

func test_delete_space_which_discarded_block_originated_2():
	_panelToDropCodeBlocks.create_new_space()
	_panelToDropCodeBlocks.delete_space_which_discarded_block_originated({"space_index":[1]})
	pass_test("Test passed!")
