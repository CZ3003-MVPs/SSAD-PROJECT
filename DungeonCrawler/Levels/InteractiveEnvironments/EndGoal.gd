extends Area2D

signal player_reached_end_goal

# Triggers when end goal is reached 
func _on_EndGoal_body_entered(body) -> void:
	emit_signal("player_reached_end_goal")

# Turns on monitoring
func turn_on_monitoring() -> void:
	monitoring = true
	
# Turns off monitoring
func turn_off_monitoring() -> void:
	monitoring = false
