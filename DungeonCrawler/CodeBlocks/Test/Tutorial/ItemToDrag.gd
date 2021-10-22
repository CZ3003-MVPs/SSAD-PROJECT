extends TextureRect

# Retrieves info about the item we are dragging
func get_drag_data(position):
	var data = {}
	data["texture"] = texture
	data["is_code_block"] = true
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = rect_size
	
	# this is needed to realign mouse cursor to middle of texture
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	# print(data)
	return data

# Checks if data can be dropped
func can_drop_data(position, data):
	return true

# Drops data
func drop_data(position, data):
	pass
