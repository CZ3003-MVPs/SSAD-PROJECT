extends "res://addons/gut/test.gd"

var EndGoal = load("res://DungeonCrawler/Levels/InteractiveEnvironments/EndGoal.tscn")
var _endGoal = null

func before_each():
	_endGoal = EndGoal.instance()

func after_each():
	_endGoal.free()

func test__on_EndGoal_body_entered():
	watch_signals(_endGoal)
	_endGoal._on_EndGoal_body_entered(null)
	assert_signal_emitted(_endGoal, "player_reached_end_goal")

func test_turn_on_monitoring():
	_endGoal.turn_on_monitoring()
	pass_test("Test passed!")

func test_turn_off_monitoring():
	_endGoal.turn_off_monitoring()
	pass_test("Test passed!")
