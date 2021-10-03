extends TextureRect

onready var visual_aid : ColorRect = $VisualAid 
onready var occupied_code_block : Control = $OccupiedCodeBlock
signal occupied_space

func _ready():
	print(get_index())


func get_drag_data(position):
	# Retrieve info about the item we are dragging
	if is_occupied():
		var data = {}
		var occupied_code_blk = get_occupied_code_block()
		var occupied_code_blk_texture = occupied_code_blk.texture
		var occupied_code_blk_rect_size = occupied_code_blk.rect_size
		data["space_index"] = get_index()
		
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
	if !is_occupied():
		var code_block = data["block_to_spawn"].instance()
		occupied_code_block.add_child(code_block)
		if visual_aid.visible:
			visual_aid.visible = false
		emit_signal("occupied_space")


func is_occupied() -> bool:
	return !visual_aid.visible 


func get_occupied_code_block() -> Node:
	return occupied_code_block.get_child(0)
