extends Control

const CHAR_READ_RATE = 0.002

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _ready():
	$writing.playing=true
	hide_textbox()
	add_text(":/> [00:23:62] subjet Run\n:/> [00:23:12] subjet Run\n:/> [00:23:16] subjet Run//SWORD.TXT:/> [031_91:39] subjet Run//\n:/> [00:23:18] subjet Run//DEMON.EXE:/> [028:91:39] subjet Run//\n:/> [00:91:39] subjet Run//ENTITY. :/> [00:91:39] subjet Run//\n:/> [00:56:65] subjet Run//mirror\n:/> [00:34:78] subjet Run//prec\n:/> [00:94:46] subjet Run//real\n:/> [00:69:28] subjet Run//fortune\n:/> [00:69:86] subjet Run//mystic\n:/> [00:23:91] subjet Run//Araki//ariki\n\t\tswitch (c) {\n\t\t\t\t\t\tcase 3: case 11:\n\t\t\t\t\tConsole.Write(\"-\");\n\t\t\t\t\t\tbreak;\n\t\t\t\t\t\tcase 7:\n\t\t\t\tConsole.Write(\"--\");\n\t\t\t\t\t\t\t\tbreak;\n:/> [00:21:64] subjet Run//darkfantasy\n:/> [00:22:65] subjet Run//warrior\n:/> [00:73:87] subjet Run//wizzardy\n:/> [00:27:45] subjet Run//summoning\n:/> [00:85:05] subjet Run//magic\n:/> [00:97:08] subjet Run//sigyl\n:/> [00:48:00] subjet Run//light\n:/> [00:70:60] subjet Run//night\n:/> [00:39:71] subjet Run//forest\n:/> [00:42:60] subjet Run/poisoned\n:/> [00:14:43] subjet Run/entidad\n:/> [00:29:76] subjet Run//rail.over\n:/> [00:58:69] subjet Run//SOPHIA\n:/> [00:61:88] subjet Run//WILLYAM.MINERVA\n:/> [00:41:65] subjet Run//TheChild\n:/> [00:96:16] subjet Run((91.64)):/> [00:96:16]\n\t\t\t\t\t\t\t\t\tfor (uint c = 0; c < 0x10; ++c) {\n\t\t\t\t\t\t\t\tfor (uint c = 0; c < 0x10; ++c) {\nusing System;\nusing System.IO;\nusing System.MYSTERY;\nusing System.Text\n\t\t\t\t\t\t\t\t\t\t\tfor (uint c = 0; c < 0x10; ++c) { \n\t\t\t\t\t\t\t\t\t\t\t\tfor (uint c = 0; c < 0x10; ++c) {\n//       Output encoding set to UTF-16")
	
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
	CambioEscena.cambio_escena("res://scenes/protointro3.tscn")


#en el tween conecte la señal en los tween tween todos completados
func _on_Tween_tween_all_completed() -> void:
	#pass # Replace with function body.
	$writing.playing=false		
