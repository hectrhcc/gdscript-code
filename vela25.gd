extends Control
# color carmesi  codigo =  Color( 0.86, 0.08, 0.24, 1 )
const CHAR_READ_RATE = 0.05
const COLOR_INTRO = Color("#E51A4C")

onready var textbox_container = $Textbox/textboxcontainer
onready var label =$Textbox/textboxcontainer/Panel/label
onready var label2 =$Textbox/textboxcontainer/Panel/label/label2
# que no pase el contorno el texto
func _ready():
	hide_textbox()
	add_text("Puedes Creer existen o puedes creer que no existan\nPero lo que nadie puede Negar es la existencia del         ","Misterio")
func hide_textbox():
	label.text=""
	label2.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,otro):
	label.text = next_text
	label2.text= otro
	show_textbox()
	$Textbox/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Textbox/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(otro) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Textbox/Tween.start()
	yield($Textbox/Tween, "tween_completed")
	$Textbox/Tween2.start()
	
func _on_Timer_timeout(): #recuerda que el timer tiene que tener el autostart seleccionado
	get_tree().change_scene_to(vela3)
export (PackedScene) var vela3
