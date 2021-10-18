extends TextureButton


func _ready():	
	Backend.connect("teacher_statistics", self, "save_data")

func _pressed():
	Backend.get_statistics()

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
