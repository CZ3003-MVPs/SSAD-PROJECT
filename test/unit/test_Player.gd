extends "res://addons/gut/test.gd"

var Player = load("res://DungeonCrawler/Player/Player.gd")


func test_grid_size():
	var _player = Player.new()
	
	assert_eq(_player.grid_size, 16)
	
	_player.free()
	
func test_inputs():
	var _player = Player.new()
	
	assert_eq_deep(_player.inputs, {
		'ui_up': Vector2.UP,
		'ui_down': Vector2.DOWN,
		'ui_left': Vector2.LEFT,
		'ui_right': Vector2.RIGHT
	})
	
	_player.free()
