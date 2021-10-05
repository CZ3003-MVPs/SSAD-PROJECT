extends BaseCodeBlock

export (PackedScene) var indented_space
onready var label : Label = $Label
onready var line_edit : LineEdit = $NumberOfTimesToRepeat/LineEdit
onready var spaces : VBoxContainer = $Spaces
signal created_new_space_in_code_block_wrapper(added_code_blk_wrapper)
signal deleted_new_space_in_code_block_wrapper(rect_min_size_to_delete)


func _ready() -> void:
	is_code_block_wrapper = true
	spaces.get_child(0).connect("occupied_space", self, "create_new_space")
	

func create_new_space(added_code_blk_wrapper : bool) -> void:
	var new_space = indented_space.instance()
	spaces.add_child(new_space)
	new_space.connect("occupied_space", self, "create_new_space")
	emit_signal("created_new_space_in_code_block_wrapper", added_code_blk_wrapper)


func delete_space_which_discarded_block_originated(data_dict_of_discarded_block) -> void:
	print(data_dict_of_discarded_block["space_index"])
	
	var index_of_space : int = data_dict_of_discarded_block["space_index"][0]
	var reference_to_space_to_delete = spaces.get_child(index_of_space)
	
	if data_dict_of_discarded_block["space_index"].size() > 1:
		data_dict_of_discarded_block["space_index"].erase(0)
		reference_to_space_to_delete.get_occupied_code_block().delete_space_which_discarded_block_originated(data_dict_of_discarded_block)
	else:
		reference_to_space_to_delete.queue_free()	
		#var removed_code_blk_wrapper : bool = reference_to_space_to_delete.get_node("OccupiedCodeBlock").get_child(0).is_code_block_wrapper
		print(reference_to_space_to_delete.rect_min_size)
		#emit_signal("deleted_new_space_in_code_block_wrapper", removed_code_blk_wrapper)
		emit_signal("deleted_new_space_in_code_block_wrapper", reference_to_space_to_delete.rect_min_size.y)

# For Yoke Min!!
func get_instruction():
	var instruction = []
	instruction.append(label.text)
	instruction.append(line_edit.text) # no. of times to repeat
	
	# since repeat code blk manages it's own spaces / inner blks, 
	# need to come out with some way to read the occupied code blks in Spaces here
	
	print(instruction)
	return instruction


# yoke min, you will need this function to read the instructions of the code blks within this repeat code blk
func get_reference_to_occupied_code_block_based_on_space_index(space_index : int) -> Node:
	return spaces.get_child(space_index).get_child(1)
