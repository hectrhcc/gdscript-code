extends Control

const CHAR_READ_RATE = 0.002
const CHAR_READ_RATI = 0.05
const CHAR_READ_RATA = 0.5
onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2
onready var label3 =$CanvasLayer/MarginContainer/Panel/Label3

func _ready():
	hide_textbox()
	add_text("Printf PROC\npush bx\nmov ah,0Eh ;teletype output\nxor bx, bx ;page 0\nDISPLAY_CHAR:\nlodsb ;get next character\nint 10h ;display\ntest al, al ;end of string?\njne DISPLAY_CHAR\nmov al,0Dh ;display carriage return\nint 10h\nmov al,0Ah ;  and line feed\nint 10h\npop bx\nretPrintf ENDP\nHookISR PROC GetRelocation bp\ncli ; Clear interrupt flag; interrupts disabled when interrupt flag cleared.\nmov ah, 35h ; saving old interrupt vector --> Get current interrupt handler for INT 21h . AH=35h - GET INTERRUPT VECTOR and AL=21h for int 21\nint 21h ;Get Address of Old ISR  --> Call DOS  (Current interrupt handler returned in ES:BX)\nmov word ptr [si], bx ;Save it si+2 = segment and si = offset\nmov word ptr [si+2], es\n mov ah, 25h ;Install New ISR --> DOS function 25h SET INTERRUPT VECTOR for interrupt 21h\nint 21h\nsti ;Set interrupt flag; external, maskable interrupts enabled at the end of the next instruction.\nlea si,bp+hookdone\ncall Printf \nretHookISR ENDP","Desea Ejecutar Los Nueve Talentos? (si/no):", "si ")	
	#add_text("\nDesea Ejecutar LosNuevoTalentos? (si/no): si")
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text, a,b):
	label.text = next_text
	label2.text = a
	label3.text = b
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(a) * CHAR_READ_RATI, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween3.interpolate_property(label3,"percent_visible",0.0, 1.0, len(b) * CHAR_READ_RATA, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	yield($CanvasLayer/Tween, "tween_completed")
	$CanvasLayer/Tween2.start()
	yield($CanvasLayer/Tween2, "tween_completed")
	$CanvasLayer/Tween3.start()
var iniciorandom = random_scene();


func _on_Timer_timeout():
#	
	CambioEscena.cambio_escena(iniciorandom)

func random_scene() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/araki.tscn",
		   "res://scenes/ariki.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
