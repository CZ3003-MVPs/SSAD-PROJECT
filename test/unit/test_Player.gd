extends "res://addons/gut/test.gd"

var Player = load("res://DungeonCrawler/Player/Player.gd")
var _player = Player.new()


func before_each():
	gut.p("ran setup", 2)
	

func test_grid_size():
	assert_eq(_player.grid_size, 16)
	
func test_inputs():
	assert_eq_deep(_player.inputs, {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
})

func after_each():
	gut.p("ran teardown", 2)

func before_all():
	gut.p("ran run setup", 2)

func after_all():
	gut.p("ran run teardown", 2)
