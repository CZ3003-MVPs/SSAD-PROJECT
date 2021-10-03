extends Control

var scene_path_to_load 

func _ready():
	for i in range($Levels.get_child_count()):
		global.levels.append(i+1)

	for level in $Levels.get_children():
		if str2var(level.name) in range(global.unlocked+1):
			level.set_disabled(false)
			
		else:
			level.set_disabled(true)
			level.set_normal_texture(load("res://assets/level selection/locked_level.png"))
			
		level.connect("pressed", self, "_on_Button_pressed", [level.scene_to_load])
		
	$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	

func _on_BackButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

	


