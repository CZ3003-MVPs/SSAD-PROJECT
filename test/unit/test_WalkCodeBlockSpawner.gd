extends "res://addons/gut/test.gd"

var WalkCodeBlockSpawner = load("res://DungeonCrawler/CodeBlocks/Spawner/WalkCodeBlockSpawner.tscn")
var _walkCodeBlockSpawner = null

func before_each():
	_walkCodeBlockSpawner = WalkCodeBlockSpawner.instance()

func after_each():
	_walkCodeBlockSpawner.free()

func test_can_drop_data():
	assert_true(_walkCodeBlockSpawner.can_drop_data(null, null))
	
func test_drop_data():
	_walkCodeBlockSpawner.drop_data(null, null)
	pass_test("Test passed!")
