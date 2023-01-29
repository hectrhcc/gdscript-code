extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _ready():
	hide_textbox()
	add_text("Elige el simbolo que te parezca mas Familiar")
	
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",1.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()

var mov_horizon = 0

func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_select")):
		$opcion.playing = true
		procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_izquierda")):
		$opcion.playing = true
		procesar_opc(false)
	if(Input.is_action_just_pressed("tecla_derecha")):
		$opcion.playing = true
		procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_ingreso")):
		$select.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
		seleccion(true)

func procesar_opc(aumenta):
		
	if(aumenta):
		mov_horizon += 1
	else:
		mov_horizon -= 1
		
	if(mov_horizon > 3):
		mov_horizon = 0
	elif(mov_horizon<0):
		mov_horizon = 3
	if(mov_horizon==0):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D1.position
	elif(mov_horizon==1):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D2.position
	elif(mov_horizon==2):	
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D3.position
	elif(mov_horizon==3):	
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D4.position
	

func seleccion(enter):
	if(mov_horizon==0 ):
		CambioEscena.cambio_escena("res://scenes/simbolo1.tscn")
	if(mov_horizon==1):
		CambioEscena.cambio_escena("res://scenes/simbolo2.tscn")
	if(mov_horizon==2):
		CambioEscena.cambio_escena("res://scenes/simbolo3.tscn")
	if(mov_horizon==3):
		CambioEscena.cambio_escena("res://scenes/simbolo4.tscn")
