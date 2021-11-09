# This manages background music and sfx.
extends Node2D

onready var music = $Music
onready var sfx = $Sfx

# Runs on load
func _ready():
	pass

# Plays music
func play_music(music_to_play : String) -> void:
	music.play_sound(music_to_play)

# Plays sound effect
func play_sfx(sfx_to_play : String) -> void:
	sfx.play_sound(sfx_to_play)
