extends Node2D

onready var music = $Music
onready var sfx = $Sfx

func _ready():
	play_music("Music1")

func play_music(music_to_play : String) -> void:
	music.play_sound(music_to_play)

func play_sfx(sfx_to_play : String) -> void:
	sfx.play_sound(sfx_to_play)
