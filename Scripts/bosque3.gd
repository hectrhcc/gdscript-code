extends Control

const CHAR_READ_RATE = 0.05


onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
	
func _ready():
	hide_textbox()
	add_text("hay quienes aseguran que los astros influyen en nuestra vida\ntal como la Luna influye en las mareas\nya sea por fuerzas fisicas y dinamicas como la gravedad\no por energias controlados por seres adimensionales\nhay quienes aseguran que los astros influyen directamente\nen nuestro dia a dia")
	
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
	CambioEscena.cambio_escena("res://scenes/bosque4.tscn")

