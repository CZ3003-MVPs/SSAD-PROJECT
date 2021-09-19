extends TextureRect


func can_drop_data(position, data):
	return true


func drop_data(position, data):
	if data["is_code_block"]:
		texture = data["texture"]
	
