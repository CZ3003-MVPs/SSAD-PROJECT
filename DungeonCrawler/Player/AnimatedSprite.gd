extends AnimatedSprite


func update_sprite_based_on_direction(direction : Vector2) -> void:
	if direction.x == 1:
		flip_h = false
	elif direction.x == -1:
		flip_h = true
