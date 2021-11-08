extends BaseCodeBlock

onready var label : Label = $Label

# Gets instruction
func get_instruction():
	var instruction = []
	instruction.append(label.text)
	return instruction
