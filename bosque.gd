extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/Tween2/cursor


func _ready():
	hide_textbox()
	add_text("te encuentras en medio de un oscuro bosque\nsolo puedes percibir unos pocos arboles\na tu alrededor\n\n\nmirar al cielo\n\n\nmirar el suelo\n\n\nusar concentracion","")
	
func hide_textbox():
	label.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,a):
	label.text = next_text
	label2.text = a
	show_textbox()
	
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(a) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	yield($CanvasLayer/Tween, "tween_completed")
	$CanvasLayer/Tween2.start()	
	#AQUI INTENTE OCULTAR LA FLECHA PERO NO SE OCULTO
	
#func _on_Timer_timeout():
var opc_act = 0
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _physics_process(delta):
	#if(Input.is_action_just_pressed("tecla_select")):
	#	procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_arriba")):
		$opcion.playing = true
		procesar_opc(false)
	if(Input.is_action_just_pressed("tecla_abajo")):
		$opcion.playing = true
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
		
	if(opc_act > 2):
		opc_act = 0
	elif(opc_act<0):
		opc_act= 2	
	if(opc_act == 0):
		$CanvasLayer/Tween2/cursor.rect_position = $CanvasLayer/Pos.position
	elif(opc_act ==1):
		$CanvasLayer/Tween2/cursor.rect_position =  $CanvasLayer/Pos2.position
	elif(opc_act ==2):
		$CanvasLayer/Tween2/cursor.rect_position = $CanvasLayer/Pos3.position
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
			
	
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func seleccion(enter):
	if(opc_act==0):
		CambioEscena.cambio_escena("res://scenes/cielo.tscn")
	if(opc_act==1):
		CambioEscena.cambio_escena("res://scenes/suelo.tscn")
	if(opc_act==2):
		CambioEscena.cambio_escena("res://scenes/concentracion.tscn")

