extends "res://addons/gut/test.gd"

var FadeIn = load("res://DungeonCrawler/UI/Animation/FadeIn.tscn")
var _fadeIn = null

func before_each():
	_fadeIn = FadeIn.instance()

func after_each():
	_fadeIn.free()

func test__on_AnimationPlayer_animation_finished():
	watch_signals(_fadeIn)
	_fadeIn._on_AnimationPlayer_animation_finished(null)
	assert_signal_emitted(_fadeIn, "fade_finished")
