extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite
onready var ray = $RayCast2D
onready var tween = $Tween
onready var exclamation_mark = $ExclamationMark
onready var area_to_collect = $AreaToCollect
onready var starting_position = position
signal finished_executing_code

var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}
var grid_size : int = 16
var can_move : bool = true

# Testing movement with keyboard inputs
#func _unhandled_input(event) -> void:
#	for dir in inputs.keys():
#		if event.is_action_pressed(dir):
#			move(dir)

# Reset sprite position to starting position
func reset_sprite_position() -> void:
	print("Reset Sprite Position.")
	tween.interpolate_property(self, "position", position, starting_position, 0.3, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
	
	animated_sprite.update_sprite_based_on_direction(Vector2.RIGHT)

# Move sprite according to direction given
# Also checks for collision so that Sprite cannot walk into walls
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


# Casts a ray to check if Sprite is able to move in the given direction
# Returns true if movement in given direction will not result in collision
# Returns false if movement in given direction will result in collision
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

# Show Pop-up when sprite collides
func exclaim() -> void:
	exclamation_mark.appear()
	
# Collect item
func collect() -> void:
	area_to_collect.collect()

# Checks for IF/WHILE condition in code blocks
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
			print("While condition not fulfilled!")
		elif movement_details[0] == "If":
			print("If condition not fulfilled!")
		return false
	else:
		return true


# Runs sprite animation given code blocks in the side panel
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
					yield()
			"If":
				if check_conditions(movement_details):
					yield(nested_action(movement_details), "completed")
				else:
					yield()
			_:
				print("None of the above")
	
	print(">>> FINISHED RUNNING CODE BLOCKS!")
	emit_signal("finished_executing_code")


# Execution of Walk and Collect code blocks
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


# Execution of Repeat, While and If code blocks
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
								yield()
						"If":
							if check_conditions(nested_movement_details):
								yield(nested_action(nested_movement_details), "completed")
							else:
								yield()
		"While":
			print("~~ WHILE "  + movement_details[1] + " " + movement_details[2] + ": " + str(movement_details[3]))
			if check_conditions(movement_details):
				while check_conditions(movement_details):
					yield(iterate_thru_while_or_if_blk(movement_details[3]), "completed")
		"If":
			print("~~ IF "  + movement_details[1] + " " + movement_details[2] + ": " + str(movement_details[3]))
			if check_conditions(movement_details):
				yield(iterate_thru_while_or_if_blk(movement_details[3]), "completed")
		_:
			print("None of the above")
			

# this initially doesn't work
# but i realised the reason why it doesn't is cos
# i need call this like yield(iterate_thru_if_or_repeat_blk(movement_details[3]), "completed")
# or else it cannot return back
func iterate_thru_while_or_if_blk(instructions : Array):
	for instruction in instructions:
		match instruction[0]:
			"Walk":
				yield(single_action(instruction), "completed")
			"Collect":
				yield(single_action(instruction), "completed")
			"Repeat":
				yield(nested_action(instruction), "completed")
			"While":
				if check_conditions(instruction):
					yield(nested_action(instruction), "completed")
				else:
					# this yield here is damn impt to resolve that fking edge case
					yield()
			"If":
				if check_conditions(instruction):
					yield(nested_action(instruction), "completed")
				else:
					# this yield here is damn impt to resolve that fking edge case
					yield()

