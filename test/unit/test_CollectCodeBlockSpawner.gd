extends "res://addons/gut/test.gd"

var CollectCodeBlockSpawner = load("res://DungeonCrawler/CodeBlocks/Spawner/CollectCodeBlockSpawner.tscn")
var _collectCodeBlockSpawner = null

func before_each():
	_collectCodeBlockSpawner = CollectCodeBlockSpawner.instance()

func after_each():
	_collectCodeBlockSpawner.free()

func test_can_drop_data():
	assert_true(_collectCodeBlockSpawner.can_drop_data(null, null))
	
func test_drop_data():
	_collectCodeBlockSpawner.drop_data(null, null)
	pass_test("Test passed!")
