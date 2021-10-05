extends NinePatchRect

export(PackedScene) var block_to_spawn 

func get_drag_data(position):
	# Retrieve info about the item we are dragging
	var data = {}
	data["block_to_spawn"] = block_to_spawn
	# you need this to update the min size of space as repeat blk is bigger than normal space
	data["new_min_size_for_space"] = Vector2(55, 25)
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = rect_size
	
	# this is needed to realign mouse cursor to middle of texture
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	return data


func can_drop_data(position, data):
	return true


func drop_data(position, data):
	pass
