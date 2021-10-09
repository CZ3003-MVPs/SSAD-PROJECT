extends Area2D

signal player_reached_end_goal


func _on_EndGoal_body_entered(body) -> void:
	emit_signal("player_reached_end_goal")


func turn_on_monitoring() -> void:
	monitoring = true
