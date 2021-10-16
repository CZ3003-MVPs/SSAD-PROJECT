extends "res://addons/gut/test.gd"

var PageTemplate = load("res://DungeonCrawler/UI/PageTemplate.tscn")
var _pageTemplate = null

func before_each():
	_pageTemplate = PageTemplate.instance()

func after_each():
	_pageTemplate.free()
