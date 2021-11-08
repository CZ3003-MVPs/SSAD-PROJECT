extends Control

onready var step_count_label = $"LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Steps/step_count"
onready var collision_label = $"LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Collisions/collision_count"
onready var codeblocks_label = $"LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Code Blocks/codeblock_count"
onready var star1 = $"LevelPopup/VBoxContainer/HBoxContainer/TextureRect"
onready var star2 = $"LevelPopup/VBoxContainer/HBoxContainer/TextureRect2"
onready var star3 = $"LevelPopup/VBoxContainer/HBoxContainer/TextureRect3"
signal pressed_level_selection_button
signal pressed_restart_button
signal pressed_next_button

# Runs on load
func _ready():
	pass

# Sets stars on level complete popup
func set_stars(level_statistics):
	var colouredStar = Rect2(1,3,244,235)
	var uncolouredStar = Rect2(519,310,244,235)
	
	var collisions = level_statistics[0]
	var steps = level_statistics[1]
	var code_blocks = level_statistics[2]
	
	if code_blocks < 8 and collisions < 3:
		star1.texture.region = colouredStar
		star2.texture.region = colouredStar
		star3.texture.region = colouredStar
	elif code_blocks < 12 and collisions < 6:
		star1.texture.region = colouredStar
		star2.texture.region = colouredStar
		star3.texture.region = uncolouredStar
	else: 
		star1.texture.region = colouredStar
		star2.texture.region = uncolouredStar
		star3.texture.region = uncolouredStar

# Sets step var
func setstepVar(value):
	get_node("LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Steps/step_count")

# Triggers when level selection is pressed
func _on_LevelSelectionButton_pressed():
	emit_signal("pressed_level_selection_button")

# Triggers when restart is pressed
func _on_RestartButton_pressed():
	emit_signal("pressed_restart_button")

# Triggers when next is pressed
func _on_NextButton_pressed():
	emit_signal("pressed_next_button")
