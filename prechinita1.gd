extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_chinita = random_scene_chinita();

onready var textbox_container =$Textbox/textboxcontainer
onready var label =$Textbox/textboxcontainer/Panel/Label

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
	$Textbox/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Textbox/Tween.start()
	
	
func _on_Timer_timeout():
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_chinita)


#export (PackedScene) var chinita1
func random_scene_chinita() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/prechinita1.tscn",
		   "res://scenes/prechinita2.tscn",
		   "res://scenes/prechinita3.tscn",
		   #"res://scenes/prechinita4.tscn",
		   #"res://scenes/prechinita5.tscn",
		   #"res://scenes/prechinita6.tscn",
		   #"res://scenes/prechinita7.tscn",
		   #"res://scenes/prechinita9.tscn",
		   #"res://scenes/prechinita10.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
