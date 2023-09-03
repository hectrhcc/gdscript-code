extends Control

const CHAR_READ_RATE = 0.05


onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
	
func _ready():
	hide_textbox()
	add_text("En la ciudad hay muchas criaturas magicas... pero también hay \nmuchas distracciones... un buen ejercicio es el alejarse de la ciudad.\n\nBuscar un lugar solitario para concentrarse, puede ser desertico, playa  o bosque.\n\nal poco tiempo te aseguro que entraras en contacto\ncon \"criaturas menores\" pequeños seres curiosos de los humanos\n\nsi deseas hacer contacto pero no puedes salir de la ciudad.\nbusca siempre debajo de tu cama")
	
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	
func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/B3.tscn")

