extends Control

onready var spaces = $Spaces
signal notify_sprite(list_of_movements)


func read_code_blocks() -> void:
	var list_of_instructions = []
	for space in spaces.get_children():
		if space.is_occupied():
			var occupied_code_block : BaseCodeBlock = space.get_occupied_code_block()
			print("[" + occupied_code_block.get_name() + "]")  
			list_of_instructions.append(occupied_code_block.get_instruction())
	print("list_of_instructions: " + str(list_of_instructions))
	emit_signal("notify_sprite", list_of_instructions)
