extends BaseCodeBlock

onready var label : Label = $Label


func get_instruction():
	var instruction = []
	instruction.append(label.text)
	# print(instruction)
	return instruction
