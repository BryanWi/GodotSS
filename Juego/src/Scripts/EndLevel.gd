extends Area2D

func _on_Cabeza_body_entered(body: Node) -> void:
	if body.get_name() == "Player":
		get_tree().reload_current_scene()
