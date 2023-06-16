extends Control

const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label

func _ready():
	hide_textbox()
	add_text("seguir ruta de las estrellas\n\nusar concentracion\n\nmirar al suelo")
	
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
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Pos.position
	elif(opc_act ==1):
		$CanvasLayer/cursor.rect_position =  $CanvasLayer/Pos2.position
	elif(opc_act ==2):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/Pos3.position
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
			
	
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func seleccion(enter):
	if(opc_act==0):
		CambioEscena.cambio_escena("res://scenes/cielo3.tscn")
	if(opc_act==1):
		MusicaControl.musica_cielo_stop()
		CambioEscena.cambio_escena("res://scenes/concentracion.tscn")
	if(opc_act==2):
		MusicaControl.musica_cielo_stop()
		CambioEscena.cambio_escena("res://scenes/suelo.tscn")
