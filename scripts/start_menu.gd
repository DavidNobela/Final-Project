extends CenterContainer

@onready var start_game_button = %StartGameButton


func  _ready():
	start_game_button.grab_focus()
	pass

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


