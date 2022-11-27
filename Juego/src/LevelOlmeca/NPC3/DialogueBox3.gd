extends Control
var dialog = [
	"La cabeza de adelante fue lo que los hizo famosos. Los olmecas tallaban caras de piedra gigantes...",
	"Algo que intrigo mucho a los investigadores.",
	"Para hacer la ofrenda solo acercate a la cabeza, pero antes de eso...", 
	"Asegurate de tener 16 jarrones de jade, estos los puedes ver en la esquina superior izquierda",
	"Si se te paso alguno, es momento de regresar y recolectar los faltantes."
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
