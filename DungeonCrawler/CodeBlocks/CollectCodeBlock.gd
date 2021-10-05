extends BaseCodeBlock

onready var label : Label = $Label
onready var option_button : OptionButton = $OptionButton


func get_instruction():
	var instruction = []
	instruction.append(label.text)
	instruction.append(option_button.text)
	print(instruction)
	return instruction
