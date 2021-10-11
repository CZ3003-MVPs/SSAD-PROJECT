extends "res://addons/gut/test.gd"

var BaseCodeBlock = load("res://DungeonCrawler/CodeBlocks/BaseCodeBlock.tscn")
var _baseCodeBlock = null

func before_each():
	_baseCodeBlock = BaseCodeBlock.instance()

func after_each():
	_baseCodeBlock.free()

func test_get_instruction():
	assert_false(_baseCodeBlock.is_code_block_wrapper)
	_baseCodeBlock.get_instruction()
	pass_test("Test passed!")
