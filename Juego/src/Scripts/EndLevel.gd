extends Area2D

func _on_Cabeza_body_entered(body: Node) -> void:
	if body.get_name() == "Player" and PlayerData.score >= 16:
		get_tree().change_scene("res://src/Menu/MainMenu.tscn")
