extends TextureRect

onready var visual_aid : ColorRect = $VisualAid 
onready var occupied_code_block : Control = $OccupiedCodeBlock


func can_drop_data(position, data):
	return true


func drop_data(position, data):
	#texture = data["texture"]
	var code_block = data["block_to_spawn"].instance()
	occupied_code_block.add_child(code_block)
	if visual_aid.visible:
		visual_aid.visible = false


func is_occupied() -> bool:
	return !visual_aid.visible 


func get_occupied_code_block() -> Node:
	return occupied_code_block.get_child(0)
