# This manages anything that has to do with controlling the player.
# Use cases include:
# what the player will do based on executing code blocks
# reseting player's position back to it's initial starting position
# what the player will do when the execution of code blocks is terminated
extends KinematicBody2D

export(String, "ui_left", "ui_right") var starting_direction
onready var animated_sprite = $AnimatedSprite
onready var ray = $RayCast2D
onready var tween = $Tween
onready var exclamation_mark = $ExclamationMark
onready var area_to_collect = $AreaToCollect
onready var starting_position = position
var no_of_collisions = 0
var no_of_steps = 0
var to_terminate = false
signal finished_executing_code

var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}
var grid_size : int = 16
var can_move : bool = true

var default_sprite_animation_duration : float = 0.5
var sprite_animation_duration : float = 0.5

# Testing movement with keyboard inputs
# func _unhandled_input(event) -> void:
#	for dir in inputs.keys():
#		if event.is_action_pressed(dir):
#			move(dir)

# Loads on startup
func _ready():
	animated_sprite.update_sprite_based_on_direction(inputs[starting_direction])


# Resets sprite position to starting position
func reset_sprite_position() -> void:
	tween.interpolate_property(self, "position", position, starting_position, sprite_animation_duration, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
	
	animated_sprite.update_sprite_based_on_direction(inputs[starting_direction])

# Moves sprite according to direction given
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
			tween.interpolate_property(self, "position", position, new_position, sprite_animation_duration, Tween.TRANS_QUINT, Tween.EASE_OUT)
			tween.start()
			animated_sprite.update_sprite_based_on_direction(movement_vector.normalized())
			randomize()
			var walk_index = (randi() % 10) + 1
			AudioManager.play_sfx("Walk" + str(walk_index))
		else:
			# print("Collided into ", collider)
			no_of_collisions += 1
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
			# print("Collision detected, can't move " + dir)
			return false

# Sets can_move to true
func _on_Tween_tween_all_completed() -> void:
	can_move = true

# Shows Pop-up when sprite collides
func exclaim() -> void:
	exclamation_mark.appear()
	randomize()
	var grunt_index : int = (randi() % 3) + 1
	AudioManager.play_sfx("Grunt" + str(grunt_index))
	
# Collects item
func collect() -> void:
	area_to_collect.collect()

# Terminates
func terminate():
	to_terminate = true

# Undo terminate
func unterminate():
	to_terminate = false


# Toggles speed
func toggle_speed(speed):
	match speed:
		"x1":
			sprite_animation_duration = default_sprite_animation_duration
		"x2":
			sprite_animation_duration = default_sprite_animation_duration / 2
		"x4":
			sprite_animation_duration = default_sprite_animation_duration / 4
		_:
			pass


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
			pass
		elif movement_details[0] == "If":
			pass
		return false
	else:
		return true


# Runs sprite animation given code blocks in the side panel and emits signal that counts statistics
func _on_RunCodeButton_move_sprite(list_of_movements):
	var statistics = []
	no_of_collisions = 0
	no_of_steps = 0
	for movement_details in list_of_movements:
		match movement_details[0]:
			"Walk":
				yield(single_action(movement_details), "completed")
			"Collect":
				yield(single_action(movement_details), "completed")
			"Repeat":
				if movement_details[2].size() != 0 and to_terminate != true:
					yield(nested_action(movement_details), "completed")
				else:
					yield(get_tree(), "idle_frame")
			"While":
				if check_conditions(movement_details) and to_terminate != true:
					yield(nested_action(movement_details), "completed")
				else:
					yield(get_tree(), "idle_frame")
			"If":
				if check_conditions(movement_details) and to_terminate != true:
					yield(nested_action(movement_details), "completed")
				else:
					yield(get_tree(), "idle_frame")
			_:
				pass
	
	statistics.append(no_of_collisions)
	statistics.append(no_of_steps)
	emit_signal("finished_executing_code", statistics)


# Execution of Walk and Collect code blocks
func single_action(movement_details):
	if to_terminate != true:
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
				no_of_steps += 1

			"Collect":
				collect()
				no_of_steps += 1
			_:
				pass
		
		# Delay to allow animation to finish playing
		yield(get_tree().create_timer(sprite_animation_duration + 0.2), "timeout")
	else:
		# end it
		yield(get_tree(), "idle_frame")


# Execution of Repeat, While and If code blocks
func nested_action(movement_details):
	match movement_details[0]:
		"Repeat":
			var no_of_repetitions = movement_details[1]
			for i in range(no_of_repetitions):
				if to_terminate != true:
					yield(iterate_thru_nested_blk(movement_details[2]), "completed")
		"While":
			if check_conditions(movement_details):
				while check_conditions(movement_details) and to_terminate != true:
					if movement_details[3].size() != 0:
						yield(iterate_thru_nested_blk(movement_details[3]), "completed")
					else:
						yield(get_tree(), "idle_frame")
			else:
				yield(get_tree(), "idle_frame")
		"If":
			if check_conditions(movement_details) and to_terminate != true:
				if movement_details[3].size() != 0:
					yield(iterate_thru_nested_blk(movement_details[3]), "completed")
				else: 
					yield(get_tree(), "idle_frame")
			else:
				yield(get_tree(), "idle_frame")
		_:
			pass
			yield(get_tree(), "idle_frame")
			

# Iterate through instructions in nested blocks
func iterate_thru_nested_blk(instructions : Array):
	for instruction in instructions:
		match instruction[0]:
			"Walk":
				yield(single_action(instruction), "completed")
			"Collect":
				yield(single_action(instruction), "completed")
			"Repeat":
				if instruction[2].size() != 0 and to_terminate != true:
					yield(nested_action(instruction), "completed")
				else:
					yield(get_tree(), "idle_frame")
			"While":
				if check_conditions(instruction) and to_terminate != true:
					yield(nested_action(instruction), "completed")
				else:
					yield(get_tree(), "idle_frame")
			"If":
				if check_conditions(instruction) and to_terminate != true:
					yield(nested_action(instruction), "completed")
				else:
					yield(get_tree(), "idle_frame")
