extends Node2D

onready var music = $Music
onready var sfx = $Sfx


func play_sfx(sfx_to_play : String) -> void:
	sfx.play_sound(sfx_to_play)
