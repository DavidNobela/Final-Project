extends Node

@onready var animation_player = $AnimationPlayer

func fade_from_black():
	animation_player.play("Fade from black")
	await animation_player.animation_finished

func fade_to_black():
	animation_player.play("Fade to black")
	await animation_player.animation_finished
