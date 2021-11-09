# This is the base class that all code blocks will inherit from.
extends NinePatchRect
class_name BaseCodeBlock

var is_code_block_wrapper : bool = false



# To be overridden by code blks that inherit this script
func get_instruction():
	pass
	
