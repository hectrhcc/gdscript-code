extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_lagartija = random_scene_lagartija();

onready var textbox_container =$CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
func _physics_process(delta):
	MiSingleton._salir()
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
	CambioEscena.cambio_escena(iniciorandom_lagartija)


#export (PackedScene) var chinita1
func random_scene_lagartija() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/lagartija1.tscn",
		   "res://scenes/lagartija2.tscn",
		   "res://scenes/lagartija3.tscn",
		   #"res://scenes/lagartija4.tscn",
		   #"res://scenes/lagartija5.tscn",
		   #"res://scenes/lagartija6.tscn",
		   #"res://scenes/lagartija7.tscn",
		   #"res://scenes/lagartija8.tscn",
		   #"res://scenes/lagartija9.tscn",
		   #"res://scenes/lagartija10.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
