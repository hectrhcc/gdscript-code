extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2

func _ready():
	hide_textbox()
	add_text("te encuentras en medio de un oscuro bosque\nsolo puedes percibir unos pocos arboles\na tu alrededor","\n\n\nmirar al cielo\n\n\nmirar el suelo\n\n\nusar concentracion")
	
func hide_textbox():
	label.text=""
	label2.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,a):
	label.text = next_text
	label2.text = a
	show_textbox()
	
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	if ($CanvasLayer/Tween.is_active()):
		$CanvasLayer/Tween2.stop(label2)
	yield($CanvasLayer/Tween, "tween_completed") #gracias, esto sirve pa detener y pa las señales en este caso de que tween termino
	$CanvasLayer/Tween2.start()


func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/bosque2.tscn")
