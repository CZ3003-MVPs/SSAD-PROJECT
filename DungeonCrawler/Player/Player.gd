extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite
onready var ray = $RayCast2D
onready var tween = $Tween

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



func _on_Tween_tween_all_completed() -> void:
	can_move = true


func _on_RunCodeButton_move_sprite(list_of_movements):
	for movement_details in list_of_movements:
		print("MOVING: " + str(movement_details))
		match movement_details[0]:
			"Walk":
				yield(single_action(movement_details), "completed")
			"Collect":
				yield(single_action(movement_details), "completed")
			"Repeat":
				var no_of_repetitions = movement_details[1]
				for i in range(no_of_repetitions):
					for nested_movement_details in movement_details[2]:
						print("REPEAT "  + str(i+1) + ": " + str(nested_movement_details))
						match nested_movement_details[0]:
							"Walk":
								yield(single_action(nested_movement_details), "completed")
							"Collect":
								yield(single_action(nested_movement_details), "completed")
							"Repeat":
								yield(nested_action(nested_movement_details), "completed")
							"If":
								yield(print("Essentially while"), "completed")
			"If":
				print("Essentially while")
			_:
				print("None of the above")

func single_action(movement_details):
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
			print("placeholder for collect")
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
					print("NESTED REPEAT "  + str(i+1) + ": " + str(nested_movement_details))
					match nested_movement_details[0]:
						"Walk":
							yield(single_action(nested_movement_details), "completed")
						"Collect":
							yield(single_action(nested_movement_details), "completed")
						"Repeat":
							yield(nested_action(nested_movement_details), "completed")
						"If":
							yield(print("Essentially while"), "completed")
		"If":
			print("Essentially while")
		_:
			print("None of the above")
			
