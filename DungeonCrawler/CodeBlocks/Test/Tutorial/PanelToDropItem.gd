extends TextureRect

# Checks if data can be dropped
func can_drop_data(position, data):
	return true

# Drops data
func drop_data(position, data):
	if data["is_code_block"]:
		texture = data["texture"]
	
