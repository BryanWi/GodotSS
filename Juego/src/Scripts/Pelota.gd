extends Area2D

export var score: = 1

func _on_Pelota2D_body_entered(body) -> void:
	queue_free()
	PlayerData.score += score
