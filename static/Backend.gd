extends Node

signal show_leaderboard

# User information
var user_info := {}
var level = 0

signal unlocked_levels

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

func get_leaderboard(score_field):
	var query : FirestoreQuery = FirestoreQuery.new()
	query.select(["username", score_field])
	query.from("users")
	query.order_by(score_field, FirestoreQuery.DIRECTION.DESCENDING)
	query.limit(10)
	var query_task : FirestoreTask = Firebase.Firestore.query(query)
	var result = yield(query_task, "task_finished")
	emit_signal("show_leaderboard", result)

func upload_statistics(level_statistics):
	var no_of_collisions = level_statistics[0]
	var no_of_steps = level_statistics[1]
	var no_of_code_blocks = level_statistics[2]
	print("No of collisions: " + str(no_of_collisions) + "; No of steps: " + str(no_of_steps) + "; No of code blocks: " + str(no_of_code_blocks))
	
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(user_info.id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	
	var scores = document.doc_fields.scores
	var level_name = "level" + str(level)
	scores[level_name] = {"collsions": no_of_collisions, "steps": no_of_steps, "code_blocks": no_of_code_blocks}
	
	var add_task : FirestoreTask = collection.update(user_info.id, {
		"scores": scores})
	document = yield(add_task, "task_finished")

func get_max_level():
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(user_info.id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	
	var max_level = 0
	
	for key in document.doc_fields.scores.keys():
		if (key != "total"):
			max_level = max(int(key.replace("level", "")), max_level)

	emit_signal("unlocked_levels", max_level + 1)	
