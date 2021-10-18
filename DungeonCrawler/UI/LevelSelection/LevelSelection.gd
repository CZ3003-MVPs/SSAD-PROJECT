extends Control

var scene_path_to_load 

# Loads on startup
# Levels will be locked accordingly
func _ready():
		# Make the scroll bar invisible 
	$LevelScrollContainer.get_v_scrollbar().modulate = Color(0, 0, 0, 0)
	
	Backend.connect("unlocked_levels", self, "lock_levels")
	
	Backend.get_max_level()
		
	#$BackButton.connect("pressed", self, "_on_Button_pressed", [$BackButton.scene_to_load])	
	$BackButton.connect("pressed", self, "_on_BackButton_pressed", [$BackButton.scene_to_load])	

# Signal after back button pressed
# User will be redirected to main menu
func _on_BackButton_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

func _on_Button_pressed(scene_to_load, level = null):
	if level != null:
		Backend.level = level
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 
	AudioManager.play_music("Music2")

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

func lock_levels(unlocked_level):
	if Backend.user_info.type == "teacher":
		return
	
	for level in $LevelScrollContainer/Levels.get_children():
		if int(level.name) <= unlocked_level:
			level.set_disabled(false)
			
		else:
			level.set_disabled(true)
			level.set_normal_texture(load("res://assets/level selection/locked_level.png"))
			
		level.connect("pressed", self, "_on_Button_pressed", [level.scene_to_load, int(level.name)])
