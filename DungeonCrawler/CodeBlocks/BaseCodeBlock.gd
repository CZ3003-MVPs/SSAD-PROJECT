extends NinePatchRect
class_name BaseCodeBlock


func can_drop_data(position, data):
	return true


func drop_data(position, data):
	pass



# to be overridden by code blks that inherit this script
func get_instruction():
	pass
	
