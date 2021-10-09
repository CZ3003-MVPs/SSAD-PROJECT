extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite
onready var ray = $RayCast2D
onready var tween = $Tween
onready var exclamation_mark = $ExclamationMark
onready var area_to_collect = $AreaToCollect
signal finished_executing_code

var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}
var grid_size : int = 16
var can_move : bool = true

func _unhandled_input(event) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)


func move(dir : String) -> void:
	if can_move:
		var movement_vector : Vector2 = inputs[dir] * grid_size
		ray.cast_to = movement_vector
		
		# this solved a bug where player can walk into walls, 
		# but can't come out of walls.
		# might be due to raycast taking one frame to update collision info
		# causing raycast to not detect the wall
		ray.force_raycast_update() 
		
		var collider = ray.get_collider()
		
		if !ray.is_colliding():
			can_move = false
			var new_position : Vector2 = position + movement_vector
			tween.interpolate_property(self, "position", position, new_position, 0.3, Tween.TRANS_QUINT, Tween.EASE_OUT)
			tween.start()
			animated_sprite.update_sprite_based_on_direction(movement_vector.normalized())
		else:
			print("Collided into ", collider)
			exclaim()

func able_to_move(dir : String):
	if can_move:
		var movement_vector : Vector2 = inputs[dir] * grid_size
		ray.cast_to = movement_vector
		
		ray.force_raycast_update() 
		
		var collider = ray.get_collider()
		
		if !ray.is_colliding():
			return true
		else:
			print("Collision detected, can't move " + dir)
			return false


func _on_Tween_tween_all_completed() -> void:
	can_move = true


func exclaim() -> void:
	exclamation_mark.appear()
	

func collect() -> void:
	area_to_collect.collect()
	
func check_conditions(movement_details):
	# Need to check condition is fulfilled first before calling the nested_action
	var can_option = false
	if movement_details[1] == "Can": 
		can_option = true
	var walk_direction_option = movement_details[2].split(" ")[1]
	match walk_direction_option:
			"Down":
				walk_direction_option = "ui_down"
			"Up":
				walk_direction_option = "ui_up"
			"Left":
				walk_direction_option = "ui_left"
			"Right":
				walk_direction_option = "ui_right"
	if able_to_move(walk_direction_option) != can_option:
		if movement_details[0] == "While":
			print("While condition not fulfilled since beginning!")
		elif movement_details[0] == "If":
			print("If condition not fulfilled!")
		return false
	else:
		return true


func _on_RunCodeButton_move_sprite(list_of_movements):
	for movement_details in list_of_movements:
		print(">>> RUNNING: " + str(movement_details))
		match movement_details[0]:
			"Walk":
				yield(single_action(movement_details), "completed")
			"Collect":
				yield(single_action(movement_details), "completed")
			"Repeat":
				yield(nested_action(movement_details), "completed")
			"While":
				if check_conditions(movement_details):
					yield(nested_action(movement_details), "completed")
				else:
					pass
			"If":
				if check_conditions(movement_details):
					yield(nested_action(movement_details), "completed")
				else:
					pass
			_:
				print("None of the above")
	
	print(">>> FINISHED RUNNING CODE BLOCKS!")
	emit_signal("finished_executing_code")

func single_action(movement_details):
	print("-- Doing: " + str(movement_details))
	match movement_details[0]:
		"Walk":
			if movement_details[1] == "Down":
				move("ui_down")
			elif movement_details[1] == "Up":
				move("ui_up")
			elif movement_details[1] == "Left":
				move("ui_left")
			elif movement_details[1] == "Right":
				move("ui_right")
			else:
				pass

		"Collect":
			print("-- Doing: Collect")
			collect()
		_:
			print("None of the above")
	
	# Delay to allow animation to finish playing
	yield(get_tree().create_timer(0.5), "timeout")


func nested_action(movement_details):
	match movement_details[0]:
		"Repeat":
			var no_of_repetitions = movement_details[1]
			for i in range(no_of_repetitions):
				for nested_movement_details in movement_details[2]:
					print("~~ REPEAT "  + str(i+1) + ": " + str(nested_movement_details))
					match nested_movement_details[0]:
						"Walk":
							yield(single_action(nested_movement_details), "completed")
						"Collect":
							yield(single_action(nested_movement_details), "completed")
						"Repeat":
							yield(nested_action(nested_movement_details), "completed")
						"While":
							if check_conditions(nested_movement_details):
								yield(nested_action(nested_movement_details), "completed")
							else:
								pass
						"If":
							if check_conditions(nested_movement_details):
								yield(nested_action(nested_movement_details), "completed")
							else:
								pass
		"While":
			print("~~ WHILE "  + movement_details[1] + " " + movement_details[2] + ": " + str(movement_details[3]))
			if check_conditions(movement_details):
				while check_conditions(movement_details):
					for nested_movement_details in movement_details[3]:
						match nested_movement_details[0]:
							"Walk":
								yield(single_action(nested_movement_details), "completed")
							"Collect":
								yield(single_action(nested_movement_details), "completed")
							"Repeat":
								yield(nested_action(nested_movement_details), "completed")
							"While":
								if check_conditions(nested_movement_details):
									yield(nested_action(nested_movement_details), "completed")
								else:
									pass
							"If":
								if check_conditions(nested_movement_details):
									yield(nested_action(nested_movement_details), "completed")
								else:
									pass
		"If":
			print("~~ IF "  + movement_details[1] + " " + movement_details[2] + ": " + str(movement_details[3]))
			if check_conditions(movement_details):
				for nested_movement_details in movement_details[3]:
					match nested_movement_details[0]:
						"Walk":
							yield(single_action(nested_movement_details), "completed")
						"Collect":
							yield(single_action(nested_movement_details), "completed")
						"Repeat":
							yield(nested_action(nested_movement_details), "completed")
						"While":
							if check_conditions(nested_movement_details):
								yield(nested_action(nested_movement_details), "completed")
							else:
								pass
						"If":
							if check_conditions(nested_movement_details):
								yield(nested_action(nested_movement_details), "completed")
							else:
								pass
		_:
			print("None of the above")
			
