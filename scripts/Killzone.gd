extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	#pass # Replace with function body.
	print("You Died")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1.0
	#pass # Replace with function body.
	get_tree().reload_current_scene()
