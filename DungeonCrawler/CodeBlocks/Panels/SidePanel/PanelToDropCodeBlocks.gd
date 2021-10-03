extends Control

export (PackedScene) var space
onready var spaces = $ScrollContainer/Spaces
signal notify_sprite(list_of_movements)


func _ready() -> void:
	spaces.get_child(0).connect("occupied_space", self, "create_new_space")


func create_new_space() -> void:
	var new_space = space.instance()
	spaces.add_child(new_space)
	new_space.connect("occupied_space", self, "create_new_space")


func delete_space_which_discarded_block_originated(data_dict_of_discarded_block) -> void:
	var index_of_space : int = data_dict_of_discarded_block["space_index"]
	spaces.get_child(index_of_space).queue_free()
		

func read_code_blocks() -> void:
	var list_of_instructions = []
	for space in spaces.get_children():
		if space.is_occupied():
			var occupied_code_block : BaseCodeBlock = space.get_occupied_code_block()
			print("[" + occupied_code_block.get_name() + "]")  
			list_of_instructions.append(occupied_code_block.get_instruction())
	print("list_of_instructions: " + str(list_of_instructions))
	emit_signal("notify_sprite", list_of_instructions)



