extends Control

const CHAR_READ_RATE = 0.05


onready var textbox_container = $Textbox/textboxcontainer
onready var label =$Textbox/textboxcontainer/Panel/Label
	
func _ready():
	hide_textbox()
	add_text("Muchas Gracias por iniciar este viaje")
	
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
	get_tree().change_scene_to(vela2)
export (PackedScene) var vela2
