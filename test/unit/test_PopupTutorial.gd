extends "res://addons/gut/test.gd"

var PopupTutorial = load("res://DungeonCrawler/UI/Tutorial/PopupTutorial.tscn")
var _popupTutorial = null

func before_each():
	_popupTutorial = PopupTutorial.instance()

func after_each():
	_popupTutorial.free()

func test__on_Buttons_pressed():
	_popupTutorial._on_CloseButton_pressed()
	_popupTutorial._on_NextButton1_pressed()
	_popupTutorial._on_NextButton2_pressed()
	_popupTutorial._on_PrevButton2_pressed()
	_popupTutorial._on_PrevButton3_pressed()
	pass_test("Test passed!")
