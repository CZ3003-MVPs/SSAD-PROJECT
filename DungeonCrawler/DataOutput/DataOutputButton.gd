extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _pressed():
	# Call Firebase Data
	
	
	var temp_data = {
		"student1": {"data":"found"},
		"student2": {"data":"found:", "total": "woohoo"}
	}
	
	# Translate dict to CSV if necessary
	# https://github.com/Seneketh/dict_tools_godot/blob/master/DictCSV.gd
	
	save_data(temp_data)

func save_data(data, file_open=true):
	var save_file = File.new()
	
	var curr_time = get_datetime_as_string()
	
	save_file.open("user://output_data %s.json" % curr_time, File.WRITE)
	save_file.store_line(to_json(data))
	save_file.close()
	if file_open:
		OS.shell_open(ProjectSettings.globalize_path("user://"))
	print("Save done!")

func get_datetime_as_string():
	var time = OS.get_datetime()
	var date_stamp = "%d-%d-%d" % [time["day"], time["month"], time["year"]]
	var time_stamp = "%d-%d-%d" % [time["hour"], time["minute"], time["second"]]
	var date_time_stamp = "%s %s" % [date_stamp, time_stamp]
	return date_time_stamp
