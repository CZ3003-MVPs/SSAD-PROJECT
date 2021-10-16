extends Button

var possible_speeds : Array = ["x1", "x2", "x4"]
var number_of_times_pressed : int = 0
signal toggled_speed_button


# maybe speed setting is a global variable 
# might be easier to do it like that
func _ready():
	pass
	# text = current_speed_setting


func _on_SpeedButton_pressed():
	number_of_times_pressed += 1
	var index : int = number_of_times_pressed % 3
	text = possible_speeds[index]
	emit_signal("toggled_speed_button")
