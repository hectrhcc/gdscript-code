extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
func _ready():
	$writing.playing=true
	hide_textbox()
	add_text("Bienvenido a este plano de existencia!\nMe alegra que hayas llegado hasta aquí.\n¿Qué te trae a este lugar?")
	
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
	yield($CanvasLayer/Tween, "tween_completed")
	$writing.playing = false
func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/entidadrandom.tscn")
