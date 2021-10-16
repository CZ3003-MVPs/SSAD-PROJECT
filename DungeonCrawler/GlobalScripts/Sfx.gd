extends Node2D

func play_sound(sound_to_play : String) -> void:
	var node_of_sound : AudioStreamPlayer = get_node(sound_to_play)
	if node_of_sound != null:
		node_of_sound.play()
