extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $PickupSound/AnimationPlayer


func _on_body_entered(_body):
	game_manager.add_point()
	animation_player.play("PickUpAnimation")
