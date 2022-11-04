extends Button

func _on_Button_button_up() -> void:
	get_tree().change_scene("res://src/Menu/LevelSelector.tscn")


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://src/Menu/LevelSelector.tscn")
