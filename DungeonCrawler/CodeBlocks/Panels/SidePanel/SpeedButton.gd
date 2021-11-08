extends Button

var possible_speeds : Array = ["x1", "x2", "x4"]
var number_of_times_pressed : int = 0
signal toggled_speed_button


# Runs on load
func _ready():
	pass

# Emits signal when speed button is pressed
func _on_SpeedButton_pressed():
	number_of_times_pressed += 1
	var index : int = number_of_times_pressed % 3
	text = possible_speeds[index]
	emit_signal("toggled_speed_button", text)
