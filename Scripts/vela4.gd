extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $Textbox/textboxcontainer
onready var label =$Textbox/textboxcontainer/Panel/Label
onready var label2 =$Textbox/textboxcontainer/Panel/Label/Label2
onready var label3 =$Textbox/textboxcontainer/Panel/Label/Label3


func _ready():
	hide_textbox()
	add_text(" PARA INICIAR SU CAMINO HACIA           ","EL MISTERIO","\nELIJA ALGUNA DE LAS SIGUIENTES OPCIONES:")
	
func hide_textbox():
	label.text=""
	label2.text=""
	label3.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,uno,dos):
	label.text = next_text
	label2.text = uno
	label3.text = dos
	show_textbox()
	
	$Textbox/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Textbox/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(uno) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Textbox/Tween3.interpolate_property(label3,"percent_visible",0.0, 1.0, len(dos) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Textbox/Tween.start()
	yield($Textbox/Tween, "tween_completed")
	$Textbox/Tween2.start()
	yield($Textbox/Tween2, "tween_completed")
	$Textbox/Tween3.start()
	
	
func _on_Timer_timeout():
	get_tree().change_scene_to(opciones9talentos)

export (PackedScene) var opciones9talentos
