extends Node


const paths = {
	"MAIN_MENU" : "res://src/Menu/MainMenu.tscn",
	"LEVEL_SELECTOR" : "res://src/Menu/LevelSelector.tscn",
	"LEVEL_MAYA" : "res://src/LevelMaya/LevelMaya.tscn"
}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_scene(route:String):
	get_tree().change_scene(paths[route])
