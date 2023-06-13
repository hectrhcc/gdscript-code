extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2
onready var label3 =$CanvasLayer/MarginContainer/Panel/Label3
func _physics_process(delta):
	MiSingleton._salir()
func _ready():
	MusicaControl.musica_intro_stop()
	MusicaControl.musica_precognicion()
	hide_textbox() 
	add_text("La","Precognición",",también llamada\npresciencia o premonición.                \nEs la capacidad psiquica               \npara  conocer o ver eventos en el Futuro                ")
	
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
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	yield($CanvasLayer/Tween, "tween_completed")
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(uno) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.start()
	yield($CanvasLayer/Tween2, "tween_completed")
	$CanvasLayer/Tween3.interpolate_property(label3,"percent_visible",0.0, 1.0, len(dos) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween3.start()
	
	
func _on_Timer_timeout():
	get_tree().change_scene_to(precognicion2)
export (PackedScene) var precognicion2
