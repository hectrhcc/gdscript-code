extends Control

var op_act = 0
var thread
	
# The thread will start here.
func _ready():
	thread = Thread.new()
	# Third argument is optional userdata, it can be any variable.
	thread.start(self, "_thread_function", "Hora espejo")
	#OS.delay_msec(58000) casi una buena idea

# Run here and exit.
# The argument is the userdata passed from start().
# If no argument was passed, this one still needs to
# be here and it will be null.
func _thread_function(userdata):	
	var nombre_escena =get_tree().current_scene.name
	MiSingleton.escena_guardada= nombre_escena
	print("nombre de la escena:", MiSingleton.escena_guardada)
	#para que la hora se actualize tiene que estar dentro de un while porque sino solo va estar seteadoc con la hora de la primera ejecucion
	print("mi singleton:",MiSingleton.Estado_Hora)
	while (thread.is_active()): #Input.is_action_just_pressed("ui_cancel")==false
		var time = Time.get_time_dict_from_system()
		var hour = time.hour
		var minutes = time.minute
		#solo pa revisar que todo estaba bien
		print("entre al while")
		print("Estado hora:",MiSingleton.Estado_Hora)
		print("hora:", hour)
		print("minutos:", minutes)
		yield(get_tree().create_timer(5),"timeout")
		if (hour == minutes and MiSingleton.Estado_Hora == true ):
			CambioEscena.cambio_escena("res://scenes/hora_espejo.tscn")
			MiSingleton.Estado_Hora = false
		if (MiSingleton.Estado_Hora ==false):
			yield(get_tree().create_timer(3600),"timeout")
			MiSingleton.Estado_Hora = true
	
# Thread must be disposed (or "joined"), for portability.
func _exit_tree():
	thread.wait_to_finish()

func _physics_process(delta):
	MiSingleton._salir()
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
#Aqui empieza el hilo para que llame a la hora espejo
# Called when the node enters the scene tree for the first time.
	
