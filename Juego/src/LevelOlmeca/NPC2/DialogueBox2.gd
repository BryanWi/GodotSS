extends Control
var dialog = [
	"Probablemente no sepas quien eres, pero para eso estoy aquí, tú eres un olmeca",
	"Los olmecas fueron la primera civilización en todo mesoamérica, con sus propias sociedades y centros urbanos...",
	"Eran famosos por sus grandes esculturas, el chocolate, maíz y sus figuras extrañas.",
	"Por ser los primeros en ser una civilización, las proximas civilizaciones les copiaron algunas cosas tales como...",
	"El arte en la cerámica y en el jade y en las criaturas como lo que soy yo, un dios serpiente.",
	"Los olmecas nacieron 1,200 años antes de que naciera Cristo y se extinguieron 400 años antes de cristo. Duraron 800 años."
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
