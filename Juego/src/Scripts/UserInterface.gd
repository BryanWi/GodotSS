extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
var coins = 0

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	$ScoreLabel.text = String(coins)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = !paused
		scene_tree.set_input_as_handled()


func update_interface() -> void:
	coins += 1
	$ScoreLabel.text = String(coins)
	

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func _on_Regresar_button_up() -> void:
	self.paused = false

func _on_Salir_button_up() -> void:
	#scene_tree.change_scene("res://src/Menu/MainMenu.tscn")
	
	scene_tree.paused = false
	Global.change_scene("MAIN_MENU")
