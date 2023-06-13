extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _physics_process(delta):
	MiSingleton._salir()
func _ready():
	hide_textbox()
	add_text("\"La memoria es el único paraíso\ndel que no podemos ser expulsados\"")
	
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
	CambioEscena.cambio_escena("res://scenes/postsimbolos.tscn")
