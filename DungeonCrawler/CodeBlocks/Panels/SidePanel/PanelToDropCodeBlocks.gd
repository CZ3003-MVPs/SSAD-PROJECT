extends Control

export (PackedScene) var space
onready var spaces = $ScrollContainer/Spaces
signal notify_sprite(list_of_movements)

# Called when loaded
func _ready() -> void:
	spaces.get_child(0).connect("occupied_space", self, "create_new_space")

# Create new space to drop code blocks
func create_new_space() -> void:
	var new_space = space.instance()
	spaces.add_child(new_space)
	new_space.connect("occupied_space", self, "create_new_space")

# Delete space occupied previously after a code block has been discarded
func delete_space_which_discarded_block_originated(data_dict_of_discarded_block) -> void:
	# print(data_dict_of_discarded_block["space_index"])
	
	# data_dict_of_discarded_block["space_index"] will be a list that contains indexes which the code
	# blk came from
	# e.g. [1] means that the blk came from the second space
	# e.g. [0, 0] means that the blk came from the first space's first indented space
	# e.g. [0, 0, 0] means that the blk came from the first space's first indented space's first 
	# indented space (fking confusing but a use case for this would be a deleting a space in a nested repeat
	# block
	
	var index_of_space : int = data_dict_of_discarded_block["space_index"][0]
	var reference_to_space_to_delete = spaces.get_child(index_of_space)
	
	if data_dict_of_discarded_block["space_index"].size() > 1:
		# if list size is more than 1, we have to remove the first element of list and pass the data
		# into the occupied block's delete_space_which_discarded_block_originated function
		data_dict_of_discarded_block["space_index"].remove(0)
		reference_to_space_to_delete.get_occupied_code_block().delete_space_which_discarded_block_originated(data_dict_of_discarded_block)
	else:	
		reference_to_space_to_delete.queue_free()	


# Reads and converts the information in code blocks into a list of instructions
func read_code_blocks() -> void:
	var list_of_instructions = []
	for space in spaces.get_children():
		if space.is_occupied():
			var occupied_code_block : BaseCodeBlock = space.get_occupied_code_block()
			# you can check REPEAT and IF blk by checking if occupied_code_block.is_code_block_wrapper
			# REPEAT and IF blk are code_block_wrappers cos they wrap around code blks
			# print("[" + occupied_code_block.get_name() + "]")
			list_of_instructions.append(occupied_code_block.get_instruction())
	# print("list_of_instructions: " + str(list_of_instructions))
	emit_signal("notify_sprite", list_of_instructions)

# Get the count of the number of code blocks in the panel
func count_code_blocks():
	var no_of_code_blocks = 0
	for space in spaces.get_children():
		if space.is_occupied():
			no_of_code_blocks += 1
			var occupied_code_block : BaseCodeBlock = space.get_occupied_code_block()
			match occupied_code_block.get_name():
				"RepeatCodeBlock":
					no_of_code_blocks += occupied_code_block.get_no_of_code_blocks()
				"WhileCodeBlock":
					no_of_code_blocks += occupied_code_block.get_no_of_code_blocks()
				"IfCodeBlock":
					no_of_code_blocks += occupied_code_block.get_no_of_code_blocks()
	return no_of_code_blocks
	
