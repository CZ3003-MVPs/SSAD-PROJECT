extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play("Fade in")
	yield(get_tree().create_timer(0.8), "timeout")
	AudioManager.play_music('Intro')
	yield(get_tree().create_timer(0.7), "timeout")
	$AnimationPlayer.play("Fade out")
	yield(get_tree().create_timer(0.5),"timeout")
	
	get_tree().change_scene("res://DungeonCrawler/UI/Login/Login.tscn")

