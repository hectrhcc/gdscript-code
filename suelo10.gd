extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _ready():
	hide_textbox()
	add_text("hurgar las pertenencias\n\nabandonar el arbol\nperderse en el bosque")
	
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

var opc_act = 0

func _physics_process(delta):
	MiSingleton._salir()
	if(Input.is_action_just_pressed("tecla_ingreso")):
		$enter.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
		seleccion(true)
		
	if(Input.is_action_just_pressed("tecla_select")):
		$opcion.playing = true
		procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_arriba")):
		$opcion.playing = true
		procesar_opc(false)
	if(Input.is_action_just_pressed("tecla_abajo")):
		$opcion.playing = true
		procesar_opc(true)
		
		
func procesar_opc(aumenta): 
	if(aumenta):
		opc_act += 1
		#$opcion.playing = true
	else:
		opc_act -= 1
		#$opcion.playing = true
	if(opc_act > 2):
		opc_act = 0
	elif(opc_act<0):
		opc_act= 2	
	if(opc_act == 0):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Pos1.position
	elif(opc_act ==1):
		$CanvasLayer/cursor.rect_position =  $CanvasLayer/Pos2.position
	elif(opc_act ==2):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Pos3.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func seleccion(ingreso):
	if(opc_act==0):
		CambioEscena.cambio_escena("res://scenes/suelo11.tscn")
	elif(opc_act==1):
		CambioEscena.cambio_escena("res://scenes/suelo15.tscn")
	elif(opc_act==2):
		CambioEscena.cambio_escena("res://scenes/bosque.tscn")
