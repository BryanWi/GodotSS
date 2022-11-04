extends Control
var dialog = [
	"Hola jugador",
	"Mi nombre es Levi y estoy aquí para guiarte",
	"Tu misión es llegar a la cabeza olmeca sin tocar a los jaguares que encontrarás en el camino.",
	"Los jaguares son muy importantes para la naturaleza y para ti."
]
var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _physics_process(delta):
	$"Indicator".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

#Funcion que carga el dialogo linea por linea en el array
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible" , 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
		
	dialog_index += 1

#Verifica que el dialogo haya terminado para desaparecer la caja de dialogo
func _on_Tween_tween_completed(object, key):
	finished = true
