extends "res://addons/gut/test.gd"

var WhileCodeBlockSpawner = load("res://DungeonCrawler/CodeBlocks/Spawner/WhileCodeBlockSpawner.tscn")
var _whileCodeBlockSpawner = null

func before_each():
	_whileCodeBlockSpawner = WhileCodeBlockSpawner.instance()

func after_each():
	_whileCodeBlockSpawner.free()

func test_can_drop_data():
	assert_true(_whileCodeBlockSpawner.can_drop_data(null, null))
	
func test_drop_data():
	_whileCodeBlockSpawner.drop_data(null, null)
	pass_test("Test passed!")
