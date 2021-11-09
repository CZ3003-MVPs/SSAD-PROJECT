extends Node2D
onready var confirmation_dialog = $QuitLevelConfirmationDialog
signal quit_level

# Runs on load
func _ready():
	pass

# Triggers when quit level is confirmed
func _on_QuitLevelConfirmationDialog_confirmed():
	emit_signal("quit_level")

	
