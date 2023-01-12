extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container =$CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
var iniciorandom_cuervo = random_scene_cuervo();


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
	CambioEscena.cambio_escena(iniciorandom_cuervo)

func random_scene_cuervo() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/cuervo1.tscn",
		   #"res://scenes/cuervo2.tscn",
		   #"res://scenes/cuervo3.tscn",
		   #"res://scenes/cuervo4.tscn",
		   #"res://scenes/cuervo5.tscn",
		   #"res://scenes/cuervo6.tscn",
		   #"res://scenes/cuervo7.tscn",
		   #"res://scenes/cuervo8.tscn",
		   #"res://scenes/cuervo9.tscn",
		   #"res://scenes/cuervo10.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
#export (PackedScene) var chinita1
