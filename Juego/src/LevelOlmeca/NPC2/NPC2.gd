extends Area2D

var interactable = false
const DIALOG = preload("res://src/LevelOlmeca/NPC2/DialogueBox2.tscn")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$Label.visible = true
		interactable = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$Label.visible = false
		interactable = false

func _input(event):
	if Input.is_key_pressed(KEY_E) and interactable == true:
		$Label.visible = false
		var dialog = DIALOG.instance()
		get_parent().add_child(dialog)
		
