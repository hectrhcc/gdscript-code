extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_serpiente = random_scene_serpiente();

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
	CambioEscena.cambio_escena(iniciorandom_serpiente)


#export (PackedScene) var chinita1
func random_scene_serpiente() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/serpiente1.tscn",
		   "res://scenes/serpiente2.tscn",
		   #"res://scenes/serpiente3.tscn",
		   #"res://scenes/serpiente4.tscn",
		   #"res://scenes/serpiente5.tscn",
		   #"res://scenes/serpiente6.tscn",
		   #"res://scenes/serpiente7.tscn",
		   #"res://scenes/serpiente8.tscn",
		   #"res://scenes/serpiente9.tscn",
		   #"res://scenes/serpiente10.tscn",
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
