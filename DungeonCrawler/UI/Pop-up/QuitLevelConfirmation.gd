extends Node2D
onready var confirmation_dialog = $QuitLevelConfirmationDialog
signal quit_level


func _ready():
	pass

func _on_QuitLevelConfirmationDialog_confirmed():
	Backend.get_max_level()
	emit_signal("quit_level")

	
