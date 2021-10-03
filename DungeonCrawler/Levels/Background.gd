extends ColorRect

signal discarded_code_block(data_dict)

func can_drop_data(position, data):
	print(data.has("space_index"))
	return data.has("space_index")


func drop_data(position, data):
	#notify LevelManager that a code blk has been discarded
	emit_signal("discarded_code_block", data)
	
