extends Control

const CHAR_READ_RATE = 0.03


onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2
	
func _ready():
	$writing.playing=true
	hide_textbox()
	add_text("Hemos logrado hacer contacto con una entidad\nEsta misma puede interactuar con usteda través de este"," ViDeOJuEgO")
	
func hide_textbox():
	label.text=""
	label2.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text, next_text2):
	label.text = next_text
	label2.text = next_text2
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(next_text2) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	yield($CanvasLayer/Tween, "tween_completed")
	$CanvasLayer/Tween2.start()
	yield($CanvasLayer/Tween2, "tween_completed")
	$writing.playing = false
	
func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/primercontacto6.tscn")




