extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _ready():
	hide_textbox()
	add_text("ELIGE UNO DE LOS SIGUIENTES ANIMALES\nPARA ADQUIRIR UNA VIRTUD")
	
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


var mov_horizon = 0
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_select")):
		$opcion.playing = true
		procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_arriba")):
		$opcion.playing = true
		procesar_apc(false)
	if(Input.is_action_just_pressed("tecla_abajo")):
		$opcion.playing = true
		procesar_apc(true)
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
		
	if(mov_horizon > 9):
		mov_horizon = 0
	elif(mov_horizon<0):
		mov_horizon = 9
	if(mov_horizon==0):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D1.position
	elif(mov_horizon==1):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D2.position
	elif(mov_horizon==2):	
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D3.position
	elif(mov_horizon==3):	
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D4.position
	elif(mov_horizon==4):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D5.position
	elif(mov_horizon==5 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D6.position
	elif(mov_horizon==6 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D7.position
	elif(mov_horizon==7 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D8.position
	elif(mov_horizon==8 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D9.position
	elif(mov_horizon==9 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D10.position


func procesar_apc(aumenta):
		
	if(aumenta):
		mov_horizon += 5
	else:
		mov_horizon -= 5
		
	if(mov_horizon > 9):
		mov_horizon = 0
	elif(mov_horizon<0):
		mov_horizon = 9
	if(mov_horizon==0):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D1.position
	elif(mov_horizon==1):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D2.position
	elif(mov_horizon==2):	
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D3.position
	elif(mov_horizon==3):	
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D4.position
	elif(mov_horizon==4):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D5.position
	elif(mov_horizon==5 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D6.position
	elif(mov_horizon==6 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D7.position
	elif(mov_horizon==7 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D8.position
	elif(mov_horizon==8 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D9.position
	elif(mov_horizon==9 ):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Position2D10.position

func seleccion(enter):
	if(mov_horizon==0 ):
		CambioEscena.cambio_escena("res://scenes/prelibelula.tscn")
	if(mov_horizon==1):
		CambioEscena.cambio_escena("res://scenes/preciervo.tscn")
	if(mov_horizon==2):
		CambioEscena.cambio_escena("res://scenes/precuervo.tscn")
	if(mov_horizon==3):
		CambioEscena.cambio_escena("res://scenes/preconejo.tscn")
	if(mov_horizon==4):
		CambioEscena.cambio_escena("res://scenes/preserpiente.tscn")
	if(mov_horizon==5):
		CambioEscena.cambio_escena("res://scenes/prechinita.tscn")
	if(mov_horizon==6):
		CambioEscena.cambio_escena("res://scenes/prelagartija.tscn")
	if(mov_horizon==7):
		CambioEscena.cambio_escena("res://scenes/pregato.tscn")
	if(mov_horizon==8):
		CambioEscena.cambio_escena("res://scenes/prearana.tscn")
	if(mov_horizon==9):
		CambioEscena.cambio_escena("res://scenes/prebuho.tscn")
