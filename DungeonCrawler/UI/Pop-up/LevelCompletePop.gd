extends Control

onready var step_count_label = $"LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Steps/step_count"
onready var collision_label = $"LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Collisions/collision_count"
signal pressed_level_selection_button
signal pressed_restart_button
signal pressed_next_button

func _ready():
	pass
	# connect("statistics_ready", LevelMan, "upload_statistics")

func _on_CloseButton_pressed():
	$LevelPopup.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setstepVar(value):
	get_node("LevelPopup/VBoxContainer/PanelContainer/VBoxContainer/Total Steps/step_count")


func _on_LevelSelectionButton_pressed():
	emit_signal("pressed_level_selection_button")


func _on_RestartButton_pressed():
	emit_signal("pressed_restart_button")


func _on_NextButton_pressed():
	emit_signal("pressed_next_button")
