extends BaseCodeBlock

onready var label : Label = $Label
onready var option_button : OptionButton = $OptionButton

# Gets instruction
func get_instruction():
	var instruction = []
	instruction.append(label.text)
	instruction.append(option_button.text)
	return instruction
