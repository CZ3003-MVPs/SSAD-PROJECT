extends Node2D


func _ready():
	my_func()

func my_func():
	print("Hello")
	yield(my_other_annoying_func(), "completed")
	print("byee")


func my_other_annoying_func():
	print("sup")
	yield()
