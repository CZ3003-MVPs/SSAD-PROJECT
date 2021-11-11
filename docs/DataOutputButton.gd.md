<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# DataOutputButton.gd

**Extends:** [TextureButton](../TextureButton)

## Description

This manages the outputting of data into csv and Json for data analysis.

## Method Descriptions

### save\_data

```gdscript
func save_data(data, file_open = true)
```

Saves data to csv/json

### parse\_dict\_to\_csv

```gdscript
func parse_dict_to_csv(data)
```

Parses dictionary to csv

### unpack\_student\_data

```gdscript
func unpack_student_data(student, student_data, max_num_levels, columns)
```

Unpacks student data

### unpack\_columns

```gdscript
func unpack_columns(data_dict, columns)
```

Unpacks columns

### generate\_header

```gdscript
func generate_header(num_levels, column_names)
```

Generates header

### generate\_level\_data\_string

```gdscript
func generate_level_data_string(level_num, columns)
```

Generates level data string

### join\_str

```gdscript
func join_str(str1, str2, sep = ",")
```

Joins string

### get\_datetime\_as\_string

```gdscript
func get_datetime_as_string()
```

Converts current datetime to string