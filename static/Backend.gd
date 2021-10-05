extends Node

# User information
var user_info := {}

func set_user_info(result):
	var result_body = {"token": result.idtoken,
		"id": result.localid}
	user_info = result_body
