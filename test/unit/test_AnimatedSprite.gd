extends "res://addons/gut/test.gd"

var AnimatedSprite = load("res://DungeonCrawler/Player/AnimatedSprite.gd")
var _animatedSprite = null

func before_each():
	_animatedSprite = AnimatedSprite.new()

func after_each():
	_animatedSprite.free()
	
func test_update_sprite_based_on_direction():
	_animatedSprite.update_sprite_based_on_direction(Vector2(1.0, 1.0))
	pass_test("Test passed!")
