extends NinePatchRect

export(PackedScene) var block_to_spawn 

func get_drag_data(position):
	# Retrieve info about the item we are dragging
	var data = {}
	data["block_to_spawn"] = block_to_spawn
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = rect_size
	
	# this is needed to realign mouse cursor to middle of texture
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	#print(data)
	return data


func can_drop_data(position, data):
	return true


func drop_data(position, data):
	pass
