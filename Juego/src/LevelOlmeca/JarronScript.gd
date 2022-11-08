extends Area2D

export var score: = 1
onready var coinSound = $AudioStreamPlayer

func _on_Jarron2D_body_entered(body):
	if coinSound.is_playing() == false:
		coinSound.play()
	queue_free()
	PlayerData.score += score
