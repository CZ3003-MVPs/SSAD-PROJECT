extends ColorRect

signal discarded_code_block(data_dict)

# Checks if data can be dropped
func can_drop_data(position, data):
	return data.has("space_index")

# Drops data
func drop_data(position, data):
	# notify LevelManager that a code block has been discarded
	emit_signal("discarded_code_block", data)
	
