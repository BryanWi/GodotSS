extends Button

func _on_Button_pressed() -> void:
	get_tree().change_scene("res://src/Menu/MainMenu.tscn")
	
func _on_Olmecas_pressed() -> void:
	get_tree().change_scene("res://src/Levels/LevelOlmeca.tscn")
