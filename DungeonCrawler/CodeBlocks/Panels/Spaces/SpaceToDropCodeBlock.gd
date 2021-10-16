extends TextureRect

onready var visual_aid : ColorRect = $VisualAid 
onready var occupied_code_block : Control = $OccupiedCodeBlock
var is_original_space : bool = true
signal occupied_space

# Retrieve info about the item we are dragging
func get_drag_data(position):

	if is_occupied():
		var data = {}
		var occupied_code_blk = get_occupied_code_block()
		var occupied_code_blk_texture = occupied_code_blk.texture
		var occupied_code_blk_rect_size = occupied_code_blk.rect_size
		
		data["space_index"] = []
		data["space_index"].append(get_index())
		# data["space_index"] will only contain one element here, since it will not be contained
		# in another space, only indented spaces can be contained in another space

		var drag_texture = TextureRect.new()
		drag_texture.expand = true
		drag_texture.texture = occupied_code_blk_texture
		drag_texture.rect_size = occupied_code_blk_rect_size

		# this is needed to realign mouse cursor to middle of texture
		var control = Control.new()
		control.add_child(drag_texture)
		drag_texture.rect_position = -0.5 * drag_texture.rect_size
		set_drag_preview(control)
		
		print(get_parent().get_parent().get_name())
		
		return data

# Checks if data can be dropped
func can_drop_data(position, data):
	# only block spawners can drop data in space
	return data.has("block_to_spawn")

# Checks for drop data
func drop_data(position, data):
	# called when u drop data into the space
	if !is_occupied():
		visual_aid.visible = false
		var code_block = data["block_to_spawn"].instance()
		occupied_code_block.add_child(code_block)
		
		
		# this is for Repeat/If blks (code block wrapper)
		if data.has("new_min_size_for_space"):
			# updates the rect_min_size of space since Repeat/If blks are bigger than normal spaces
			rect_min_size = data["new_min_size_for_space"]
			occupied_code_block.get_child(0).connect("created_new_space_in_code_block_wrapper", self, "increase_rect_min_size")
			occupied_code_block.get_child(0).connect("deleted_new_space_in_code_block_wrapper", self, "decrease_rect_min_size")
		emit_signal("occupied_space")

# Checks if occupied
func is_occupied() -> bool:
	return !visual_aid.visible 

# Increases rectangle minimum size
func increase_rect_min_size(added_code_blk_wrapper : bool) -> void:
	if added_code_blk_wrapper:
		rect_min_size.y += 29
	else: # normal code blks
		rect_min_size.y += 14
	
# Decreases rectangle minimum size
func decrease_rect_min_size(rect_min_size_to_decrease : float) -> void:
	rect_min_size.y -= rect_min_size_to_decrease

# Gets occupied code block
func get_occupied_code_block() -> Node:
	return occupied_code_block.get_child(0)
