extends "res://addons/gut/test.gd"

var Player = load("res://DungeonCrawler/Player/Player.gd")
var _player = null

func before_each():
	_player = Player.new()

func after_each():
	_player.free()

func test_grid_size():
	assert_eq(_player.grid_size, 16)
	
func test_inputs():
	assert_eq_deep(_player.inputs, {
		'ui_up': Vector2.UP,
		'ui_down': Vector2.DOWN,
		'ui_left': Vector2.LEFT,
		'ui_right': Vector2.RIGHT
	})
