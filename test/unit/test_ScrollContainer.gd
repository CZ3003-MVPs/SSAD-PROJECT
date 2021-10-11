extends "res://addons/gut/test.gd"

var ScrollContainer = load("res://DungeonCrawler/CodeBlocks/Panels/SidePanel/ScrollContainer.gd")
var _scrollContainer = null

func before_each():
	_scrollContainer = ScrollContainer.new()
	_scrollContainer._ready()

func after_each():
	_scrollContainer.free()

func test__ready():
	assert_almost_eq(_scrollContainer.get_v_scrollbar().rect_scale.x, 0.0, 0.001)
