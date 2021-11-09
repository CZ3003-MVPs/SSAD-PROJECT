# This manages the outputting of data into csv and Json for data analysis.
extends TextureButton

# Loads on startup
func _ready():	
	Backend.connect("teacher_statistics", self, "save_data")

# Gets statistics when pressed
func _pressed():
	Backend.get_statistics()

# Saves data to csv/json
func save_data(data, file_open=true):
	var save_file = File.new()
	
	var curr_time = get_datetime_as_string()
	
	var csv_data = parse_dict_to_csv(data)
	save_file.open("user://output_data %s.csv" % curr_time, File.WRITE)
	save_file.store_line(csv_data)
	save_file.close()
	
	save_file.open("user://output_data.csv", File.WRITE)
	save_file.store_line(csv_data)
	save_file.close()
	
	save_file.open("user://output_data %s.json" % curr_time, File.WRITE)
	save_file.store_line(to_json(data))
	save_file.close()
	if file_open:
		OS.shell_open(ProjectSettings.globalize_path("user://"))

# Parses dictionary to csv
func parse_dict_to_csv(data):
	var students = data.keys()
	# Generate overall header
	var sample_student_data = data[students[0]]
	var columns = sample_student_data["total"].keys()
	columns.sort()
		
		
	var max_num_levels = -1
	for student in data:
		max_num_levels = max(max_num_levels, data[student].size() - 1)
	var output = generate_header(max_num_levels, columns)
	
	# Process each student's data
	for student in students:
		var student_data = data[student]
		#if "total" in student_data.keys():
		var student_string = \
		unpack_student_data(student, data[student], max_num_levels, columns)
		output = join_str(output, student_string, "\n")
			
	return output

# Unpacks student data
func unpack_student_data(student, student_data, max_num_levels, columns):
	var output = student
	
	var num_levels_completed = student_data.size()
	
	if "total" in student_data.keys():
		num_levels_completed -= 1
		output = join_str(output, String(num_levels_completed))
		
		var total_data = student_data["total"]
		var total_data_str = unpack_columns(total_data, columns)
		output = join_str(output, total_data_str)
	
	else:
		output = join_str(output, String(num_levels_completed))
		
		var total_data_str = ",".repeat(columns.size() - 1)
		output = join_str(output, total_data_str)
	
	for i in range(1, max_num_levels+1):
		var level_data_str = ""
		var level_key = "level"+String(i)
		if level_key in student_data:
			var level_data = student_data[level_key]
			level_data_str = unpack_columns(level_data, columns)
		else:
			level_data_str = ",".repeat(columns.size() - 1)
		
		output = join_str(output, level_data_str)
		
	return output

# Unpacks columns
func unpack_columns(data_dict, columns):
	var output = ""
	for column in columns:
		var data = String(data_dict[column])
		if output == "":
			output = data
		else:
			output = join_str(output, data)
	return output

# Generates header
func generate_header(num_levels, column_names):
	var header = "student,num_levels_completed"
	for column in column_names:
		var column_name = "total_" + column
		header = join_str(header, column_name)
	for i in range(1, num_levels+1):
		var level_str = generate_level_data_string(i, column_names)
		header = join_str(header, level_str)
	return header

# Generates level data string
func generate_level_data_string(level_num, columns):
	var prefix = "l%d" % level_num
	var output_name = ""
	for column in columns:
		var column_name = join_str(prefix, column, "_")
		if output_name == "":
			output_name = column_name
		else:
			output_name = join_str(output_name, column_name)
	return output_name

# Joins string
func join_str(str1, str2, sep=","):
	return "%s%s%s" % [str1, sep, str2]

# Converts current datetime to string
func get_datetime_as_string():
	var time = OS.get_datetime()
	var date_stamp = "%d-%d-%d" % [time["day"], time["month"], time["year"]]
	var time_stamp = "%d-%d-%d" % [time["hour"], time["minute"], time["second"]]
	var date_time_stamp = "%s %s" % [date_stamp, time_stamp]
	return date_time_stamp
