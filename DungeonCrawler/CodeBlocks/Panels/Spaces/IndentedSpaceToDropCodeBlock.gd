extends TextureRect

onready var visual_aid : ColorRect = $VisualAid 
onready var occupied_code_block : Control = $OccupiedCodeBlock
var is_original_space : bool = false
signal occupied_space(added_code_blk_wrapper)


func get_drag_data(position):
	# Retrieve info about the item we are dragging
	if is_occupied():
		var data = {}
		var occupied_code_blk = get_occupied_code_block()
		var occupied_code_blk_texture = occupied_code_blk.texture
		var occupied_code_blk_rect_size = occupied_code_blk.rect_size
		
		# e.g. Repeat blk occupied first space
		# this is the case of indented space in the repeat blk
		# data["space_index"] = [0, 0]
		data["space_index"] = []
		data["space_index"].append(get_index())
		
		var reference_to_parent_space = get_reference_to_parent_space()
		
		while !reference_to_parent_space.is_original_space:
			# reference_to_parent_space is an indented space
			data["space_index"].push_front(get_index_of_parent_space(reference_to_parent_space))
			reference_to_parent_space = reference_to_parent_space.get_reference_to_parent_space()
		
		# reference_to_parent_space is an original space
		data["space_index"].push_front(get_index_of_parent_space(reference_to_parent_space))

		var drag_texture = TextureRect.new()
		drag_texture.expand = true
		drag_texture.texture = occupied_code_blk_texture
		drag_texture.rect_size = occupied_code_blk_rect_size

		# this is needed to realign mouse cursor to middle of texture
		var control = Control.new()
		control.add_child(drag_texture)
		drag_texture.rect_position = -0.5 * drag_texture.rect_size
		set_drag_preview(control)
		
		return data


func can_drop_data(position, data):
	return data.has("block_to_spawn")


func drop_data(position, data):
	# called when u drop data into the space
	if !is_occupied():
		visual_aid.visible = false
		var code_block = data["block_to_spawn"].instance()
		occupied_code_block.add_child(code_block)
		
		var added_code_blk_wrapper : bool = false
		# this is for Repeat/If blks (code block wrapper)
		if data.has("new_min_size_for_space"):
			# updates the rect_min_size of space since Repeat/If blks are bigger than normal spaces
			rect_min_size = data["new_min_size_for_space"]
			occupied_code_block.get_child(0).connect("created_new_space_in_code_block_wrapper", self, "increase_rect_min_size")
			occupied_code_block.get_child(0).connect("deleted_new_space_in_code_block_wrapper", self, "decrease_rect_min_size")
			# Parent space min rect size needs to update
			# code_blk_wrapper is repeat/if blks
			added_code_blk_wrapper = true
		emit_signal("occupied_space", added_code_blk_wrapper)


func is_occupied() -> bool:
	return !visual_aid.visible 


func increase_rect_min_size(added_code_blk_wrapper : bool) -> void:
	if added_code_blk_wrapper:
		rect_min_size.y += 29
	else: # normal code blks
		rect_min_size.y += 14
		
	# Spaces that this code blk is in all need their min rect size needs to update
	# function will keep calling up all the way to an original space that contains this indented space
	get_parent().get_parent().get_parent().get_parent().increase_rect_min_size(added_code_blk_wrapper)
	print("sup boi")


func decrease_rect_min_size(rect_min_size_to_decrease : float) -> void:
	rect_min_size.y -= rect_min_size_to_decrease
	
	# Spaces that this code blk is in all need their min rect size needs to update
	# function will keep calling up all the way to an original space that contains this indented space
	get_parent().get_parent().get_parent().get_parent().decrease_rect_min_size(rect_min_size_to_decrease)
#	print("bye boi")
	

func get_occupied_code_block() -> Node:
	return occupied_code_block.get_child(0)


func get_reference_to_parent_space() -> Node:
	return get_parent().get_parent().get_parent().get_parent()


func get_index_of_parent_space(parent_space : Node) -> int: 
	return parent_space.get_index()
