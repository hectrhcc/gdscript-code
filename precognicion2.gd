extends Control


const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
func _physics_process(delta):
	MiSingleton._salir()
func _ready():
	hide_textbox()
	add_text("para continuar con tu camino\ndeberas elegir entre las opciones:")
	
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(text):
	label.text = text
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	

func _on_Timer_timeout():
	get_tree().change_scene_to(precognicion3)

export (PackedScene) var precognicion3
