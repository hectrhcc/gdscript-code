extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2

func _ready():
	hide_textbox()
	add_text("Me introduje al bosque mas oscuro\nen busqueda de mi amada SOPHIA\n\nMi enamorada se perdio en el bosque hace unos...\nDias..Semanas.. Meses...\nNo se cuanto Tiempo ha transcurrido\ndesde que comence MI VIAJE DE BUSQUEDA\n\n\"En la oscuridad poco importa\nque todas las respuestas sean absurdas\"","WillYaM Minerva")
	
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,b):
	label.text = next_text
	label2.text = b
	show_textbox()
	
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(b) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	yield($CanvasLayer/Tween, "tween_completed")
	$CanvasLayer/Tween2.start()


func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/suelo15.tscn")
