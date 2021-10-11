extends "res://addons/gut/test.gd"

var ElseCodeBlockSpawner = load("res://DungeonCrawler/CodeBlocks/Spawner/ElseCodeBlockSpawner.tscn")
var _elseCodeBlockSpawner = null

func before_each():
	_elseCodeBlockSpawner = ElseCodeBlockSpawner.instance()

func after_each():
	_elseCodeBlockSpawner.free()

func test_can_drop_data():
	assert_true(_elseCodeBlockSpawner.can_drop_data(null, null))
	
func test_drop_data():
	_elseCodeBlockSpawner.drop_data(null, null)
	pass_test("Test passed!")
