extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var op_act = 0
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
		op_act += 1
	else:
		op_act -= 1
		
	if(op_act > 8):
		op_act = 0
	elif(op_act<0):
		op_act= 8	
		
	if(op_act == 0):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos1.position
	elif(op_act ==1):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos2.position
	elif(op_act ==2):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos3.position
	elif(op_act ==3):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos4.position
	elif(op_act ==4):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos5.position
	elif(op_act ==5):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos6.position
	elif(op_act ==6):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos7.position
	elif(op_act ==7):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos8.position
	elif(op_act ==8):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos9.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func seleccion(enter):
	if(op_act==0):
		CambioEscena.cambio_escena( "res://scenes/calavera.tscn")
	elif(op_act==1):
		CambioEscena.cambio_escena( "res://scenes/realidad.tscn")
		#get_tree().change_scene_to(realidad)
	elif(op_act==2):
		CambioEscena.cambio_escena( "res://scenes/suenos.tscn")
		#get_tree().change_scene_to(suenos)
	elif(op_act==3):
		CambioEscena.cambio_escena( "res://scenes/primercontacto.tscn")
		#get_tree().change_scene_to(primercontacto)
	elif(op_act==4):
		CambioEscena.cambio_escena( "res://scenes/oraculo.tscn")
		#get_tree().change_scene_to(oraculo)
	elif(op_act==5):
		CambioEscena.cambio_escena( "res://scenes/magia.tscn")
		#get_tree().change_scene_to(magia)
	elif(op_act==6):
		CambioEscena.cambio_escena( "res://scenes/fortuna.tscn")
		#get_tree().change_scene_to(fortuna)
	elif(op_act==7):
		CambioEscena.cambio_escena( "res://scenes/sabiduria.tscn")
		#get_tree().change_scene_to(sabiduria)
	elif(op_act==8):
		CambioEscena.cambio_escena( "res://scenes/arte.tscn")
		#get_tree().change_scene_to(arte)

#func _process(delta):
#	if $canvas/iniciar.pressed:
#		get_tree().change_scene_to(vela1)
#	if $canvas/opciones.pressed:
#		get_tree().change_scene_to(opciones)
#	if $canvas/salir.pressed:
#		get_tree().quit()
			
#export (PackedScene) var precognicion
#export (PackedScene) var realidad
#export (PackedScene) var suenos
#export (PackedScene) var primercontacto
#export (PackedScene) var oraculo
#export (PackedScene) var magia
#export (PackedScene) var fortuna
#export (PackedScene) var sabiduria
#export (PackedScene) var arte
