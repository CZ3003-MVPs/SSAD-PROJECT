extends "res://addons/gut/test.gd"

var RepeatCodeBlockSpawner = load("res://DungeonCrawler/CodeBlocks/Spawner/RepeatCodeBlockSpawner.tscn")
var _repeatCodeBlockSpawner = null

func before_each():
	_repeatCodeBlockSpawner = RepeatCodeBlockSpawner.instance()

func after_each():
	_repeatCodeBlockSpawner.free()

func test_can_drop_data():
	assert_true(_repeatCodeBlockSpawner.can_drop_data(null, null))
	
func test_drop_data():
	_repeatCodeBlockSpawner.drop_data(null, null)
	pass_test("Test passed!")
