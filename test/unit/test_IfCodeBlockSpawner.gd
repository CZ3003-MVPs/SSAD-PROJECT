extends "res://addons/gut/test.gd"

var IfCodeBlockSpawner = load("res://DungeonCrawler/CodeBlocks/Spawner/IfCodeBlockSpawner.tscn")
var _ifCodeBlockSpawner = null

func before_each():
	_ifCodeBlockSpawner = IfCodeBlockSpawner.instance()

func after_each():
	_ifCodeBlockSpawner.free()

func test_can_drop_data():
	assert_true(_ifCodeBlockSpawner.can_drop_data(null, null))
	
func test_drop_data():
	_ifCodeBlockSpawner.drop_data(null, null)
	pass_test("Test passed!")
