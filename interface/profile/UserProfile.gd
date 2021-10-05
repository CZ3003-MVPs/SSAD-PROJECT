extends Control

onready var username : LineEdit = $Container/ProfileBox/UsernameBox/LineEdit
onready var remarks : LineEdit = $Container/ProfileBox/Remarks/LineEdit
onready var count : Slider = $Container/ProfileBox/Count/Slider
onready var timing : Slider = $Container/ProfileBox/Timing/Slider
onready var title : Label = $Container/Title
onready var notification : Label = $Container/Notification

var new_profile := false
var profile := {
	"username": {},
	"remarks": {},
	"count": {},
	"timing": {}
} setget set_profile


func _ready() -> void:
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(UserInfo.user_info.id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	self.profile = document.doc_fields
	notification.text = "Update your information!"
	title.text = "EDIT PROFILE"

func _on_ConfirmButton_pressed() -> void:
	if username.text.empty() or remarks.text.empty():
		notification.text = "Enter your username and class"
		return
		
	profile.username = username.text
	profile.remarks = remarks.text
	profile.count = count.value
	profile.timing = timing.value
	
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	match new_profile:
		true:
			var add_task : FirestoreTask = collection.add(UserInfo.user_info.id, profile)
			var document : FirestoreDocument = yield(add_task, "task_finished")
		false:
			var up_task : FirestoreTask = collection.update(UserInfo.user_info.id, profile)
			var document : FirestoreDocument = yield(up_task, "task_finished")
	notification.text = "Information captured successfully! Redirecting you in 2 seconds..."
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://DungeonCrawler/UI/MenuPage/MainMenu.tscn")

func set_profile(value: Dictionary) -> void:
	profile = value
	username.text = profile.username
	remarks.text = profile.remarks
	count.value = profile.count
	timing.value = profile.timing
	
# var upload_task = Firebase.Storage.ref("icon.png").put_file("res://icon.png")
# yield(upload_task, "task_finished")
# var list_all_task = Firebase.Storage.ref("").list_all()
# yield(list_all_task, "task_finished")
# print(list_all_task.data)
# TODO: add avatar
# https://github.com/GodotNuts/GodotFirebase/wiki/Storage
