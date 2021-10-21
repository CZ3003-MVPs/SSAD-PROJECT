extends Node2D

var currently_playing : String

func play_sound(sound_to_play : String) -> void:
	if !currently_playing.empty():
		# stops the currently playing music
		var node_of_currently_playing_music : AudioStreamPlayer = get_node(currently_playing)
		node_of_currently_playing_music.stop()
	var node_of_sound : AudioStreamPlayer = get_node(sound_to_play)
	if node_of_sound != null:
		currently_playing = sound_to_play
		node_of_sound.play()
