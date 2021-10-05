extends Node

# User information
var user_info := {}

func set_user_info(result):
	var result_body = {"token": result.idtoken,
		"id": result.localid}
	user_info = result_body

func get_levels():
	var list_all_levels = Firebase.Storage.ref("levels").list_all()
	yield(list_all_levels, "task_finished")
	print(list_all_levels.data)
	pass

func upload_level(file_path):
	var upload_task = Firebase.Storage.ref(file_path).put_file("res://levels/" + file_path.split("/")[-1])
	yield(upload_task, "task_finished")
	
func get_sprites():
	var list_all_levels = Firebase.Storage.ref("sprites").list_all()
	yield(list_all_levels, "task_finished")
	print(list_all_levels.data)
	pass

func upload_sprite(file_path):
	var upload_task = Firebase.Storage.ref(file_path).put_file("res://sprites/" + file_path.split("/")[-1])
	yield(upload_task, "task_finished")

# https://github.com/GodotNuts/GodotFirebase/wiki/Storage
