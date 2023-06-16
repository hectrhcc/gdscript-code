extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_gato = random_scene_gato();
onready var textbox_container =$CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _ready():
	hide_textbox()
	add_text("\"Has Obtenido Una Virtud\"")
	
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
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_gato)


#export (PackedScene) var chinita1
func random_scene_gato() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/gato1.tscn",
		   #"res://scenes/gato2.tscn",
		   #"res://scenes/gato3.tscn",
		   #"res://scenes/gato4.tscn",
		   #"res://scenes/gato5.tscn",
		   #"res://scenes/gato6.tscn",
		   #"res://scenes/gato7.tscn",
		   #"res://scenes/gato8.tscn",
		   #"res://scenes/gato9.tscn",
		   #"res://scenes/gato10.tscn",
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
