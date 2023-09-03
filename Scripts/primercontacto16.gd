extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2
onready var label3 =$CanvasLayer/MarginContainer/Panel/Label3
onready var label4 =$CanvasLayer/MarginContainer/Panel/Label4

func _ready():
	$writing.playing=true
	hide_textbox()
	add_text("La comuniacion es", "dESMAyO", "todo lo que te rodea esta desesperadamente\n","comunicando información")
	
func hide_textbox():
	label.text=""
	label2.text=""
	label3.text=""
	label4.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,otro,otro2,otro3):
	label.text = next_text
	label2.text = otro
	label3.text = otro2
	label4.text = otro3
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(otro) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween3.interpolate_property(label3,"percent_visible",0.0, 1.0, len(otro2) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween4.interpolate_property(label4,"percent_visible",0.0, 1.0, len(otro3) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	yield($CanvasLayer/Tween, "tween_completed")
	$CanvasLayer/Tween2.start()
	yield($CanvasLayer/Tween2, "tween_completed")
	$CanvasLayer/Tween3.start()
	yield($CanvasLayer/Tween3, "tween_completed")
	$CanvasLayer/Tween4.start()
	yield($CanvasLayer/Tween4, "tween_completed")
	$writing.playing = false

func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/primercontacto17.tscn")
