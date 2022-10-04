extends Area2D

export var score: = 1

func _on_Coin2D_body_entered(body):
	$SoundCoinCollected.play(0)
	queue_free()
	print("coin")
	PlayerData.score += score
