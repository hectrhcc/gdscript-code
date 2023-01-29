extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2

func _ready():
	hide_textbox()
	add_text("intentas concentrarte en seguir una direccion\n pero el bosque parece no terminar nunca...\n\n te has perdido en el bosque","mirar el cielo\n\nusar concentracion")
	
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,c):
	label.text = next_text
	label2.text = c
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",1.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(c) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	$CanvasLayer/Tween2.start()

var opc_act = 0
func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_arriba")):
		$opcion.playing=true
		procesar_opc(false)
	if(Input.is_action_just_pressed("tecla_abajo")):
		$opcion.playing=true
		procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_ingreso")):
		$select.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
		seleccion(true)
		
func procesar_opc(aumenta): 
	if(aumenta):
		opc_act += 1
	else:
		opc_act -= 1
		
	if(opc_act > 1):
		opc_act = 0
	elif(opc_act<0):
		opc_act= 1	
	if(opc_act == 0):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Pos.position
	elif(opc_act ==1):
		$CanvasLayer/cursor.rect_position =  $CanvasLayer/Pos2.position

func seleccion(enter):
	if(opc_act==0):
			CambioEscena.cambio_escena("res://scenes/cielo.tscn")
	if(opc_act==1):	
		CambioEscena.cambio_escena("res://scenes/concentracion.tscn")


