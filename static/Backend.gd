extends Node

signal show_leaderboard

# User information
var user_info := {}
var level = 0

signal unlocked_levels
signal display_username

func set_user_info(result):
	var result_body = {"token": result.idtoken,
		"id": result.localid}
	user_info = result_body
	
func clear_user_info():
	user_info = {}

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

func create_document(result, username):
	set_user_info(result)
	var dict = {"username": username, "scores": {"total": {"score": 0, "collisions": 0, "steps": 0, "code_blocks": 0}}}
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var add_task : FirestoreTask = collection.add(user_info.id, dict)
	var document : FirestoreDocument = yield(add_task, "task_finished")

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
	var collisions = level_statistics[0]
	var steps = level_statistics[1]
	var code_blocks = level_statistics[2]
	var score = 20000 - (code_blocks * 1000 + steps * 500 + collisions * 250)
	
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(user_info.id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	
	var scores = document.doc_fields.scores
	
	var level_name = "level" + str(level)
	if scores.has(level_name):
		if scores[level_name].score >= score:
			return
		scores.total.score -= scores[level_name].score
		scores.total.collisions -= scores[level_name].collisions
		scores.total.steps -= scores[level_name].steps
		scores.total.code_blocks -= scores[level_name].code_blocks

	scores[level_name] = {"score": score, "collisions": collisions, "steps": steps, "code_blocks": code_blocks}
	scores.total.score += score
	scores.total.collisions += collisions
	scores.total.steps += steps
	scores.total.code_blocks += code_blocks
	
	var update_task : FirestoreTask = collection.update(user_info.id, {
		"scores": scores})
	document = yield(update_task, "task_finished")

func get_max_level():
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(user_info.id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	
	var max_level = 0
	
	for key in document.doc_fields.scores.keys():
		if (key != "total"):
			max_level = max(int(key.replace("level", "")), max_level)

	emit_signal("unlocked_levels", max_level + 1)	

func change_display_name(username):
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var update_task : FirestoreTask = collection.update(user_info.id, {
		"username": username})
	var document = yield(update_task, "task_finished")

func get_display_name():
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(user_info.id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	emit_signal("display_username", document.doc_fields.username)
	
func get_levels():
	var query : FirestoreQuery = FirestoreQuery.new()
	query.select(["username", "scores"])
	query.from("users")
	var query_task : FirestoreTask = Firebase.Firestore.query(query)
	var result = yield(query_task, "task_finished")
	
	var max_level = 0
	
	for user in result:
		if !user.doc_fields.has("scores"):
			return
		for key in user.doc_fields.scores.keys():
			if (key != "total"):
				max_level = max(int(key.replace("level", "")), max_level)
	
	emit_signal("levels_list", max_level + 1)
