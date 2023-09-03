extends Control

const CHAR_READ_RATE = 0.002

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _ready():
	$writing.playing=true
	hide_textbox()
	add_text("USER 009164 LOGIN: 22:03:1984  12_00PM\n AD-DOS\nVersion 2.1 (C)Copyright AB// ARAKI SYSTEMS – 1984 \n:/> [00:23:65] subjet Run \n……….    ……….     ……….\nRUNNING SCRIPTS. . .  COMPLETE\nVALIDATING IRL. . . COMPLETE\nRESTORING DATABASE…COMPLETE\nCOLLATING LOGS… COMPLETE\n……….    ……….     ……….\n PASSWORD AUTORIZADO\n[1] logs\n[2] archives\n[0] Quit\n………………. …………… …………\nConsole.Error.WriteLine();\nConsole.WriteLine(\"Current code page: {0}\\n\", \n \t \t \t  \t \t \t \t \t \t \t \t \t \t \t \t Console.OutputEncoding.CodePage);\n \t \t \t  \t \t \t // Display the characters.\n\t \t \t  \t \t \t \t \t \t \t \t foreach (var ch in chars) {\n\t \t \t  \t \t \t \t \t \t \t \t \t \t \t \t Console.Write(\"{0}  \", ch);\n\t \t \t  \t \t \t \t \t \t \t \t \t \t \t \t if (Console.CursorLeft >= 70)\n\t \t \t  \t \t \t \t \t \t \t \t \t \t \t\t\t\t\t\tConsole.WriteLine();\n:/> [00:23:65] subjet Run//Helenio\n:/> [00:43:84] subjet Run//Rito\n:/> [00:23:65] subjet Run//Resille\n:/> [60:93:15] subjet Run//Korgor\n/> [40:00:76] subjet Run//9164\n:/> [00:23:67] subjet Run//dark.temple\n:/> [00:33:66] subjet Run//dunge0n.quest\n:/> [00:33:63] subjet Run//text.adventure\n:/> [00:08:61] subjet Run//Los9talentos\n:/> [00:72:69] subjet Run//misterio\n:/> [00:28:86] subjet Run//fantasy.element\n:/> [00:26:54] subjet Run//oracle//hrs//min//seg\n:/> [00:56:38] subjet Run//01NELEH// oracle//hrs//min//seg\n:/> [00:18:84] subjet Run//0T1R// oracle//hrs//min//seg\n:/> [00:10:65] subjet Run//3LLIS3R// oracle//hrs//min//seg\n:/> [60:04:15] subjet Run//R0GR0k// oracle//hrs//min//seg\n:/> [00:23:94] subjet Run//MORNING//LATE//NIGHT\n:/> [00:20:25] subjet/// Runhe example displays the following output:\n:/> [00:14:32] subjet Run//CONSOLE_FONT_INFO_EX consoleCurrentFontEx);\n:/> [00:12:59] subjet Run//RegistryKey key = Registry.LocalMachine.OpenSubKey(\n")
	
	
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$writing.playing=false
	$CanvasLayer/Tween.start()
	

func _on_Timer_timeout():
	
	CambioEscena.cambio_escena("res://scenes/protointro2.tscn")



func _on_Tween_tween_all_completed() -> void:
	$writing.playing=false
