extends CenterContainer

@onready var start_game_button = %StartGameButton


func _ready():
	start_game_button.grab_focus()

func _on_start_game_button_pressed():
	await Transition.fade_to_black()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Transition.fade_from_black()
	
func _on_quit_buttom_pressed():
	get_tree().quit()

