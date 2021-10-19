extends Node2D


func _ready():
	my_func()

func my_func():
	yield(test_func(), "completed")


func test_func():
	yield(get_tree(), "idle_frame")
