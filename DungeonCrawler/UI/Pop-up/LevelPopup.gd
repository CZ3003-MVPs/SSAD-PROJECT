extends Popup

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("firework");

# Triggers when tool button is pressed
func _on_ToolButton_pressed():
	popup()
