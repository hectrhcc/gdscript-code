extends Control

var opc_act = 0

func _ready():
	# Ocultar el cursor del sistema operativo
	# Establecer el botón "iniciar" en rojo por defecto
	$canvas/iniciar.modulate = Color.red
	
	# Establecer la posición inicial del cursor en el botón "iniciar"
	$canvas/cursor.rect_position = $canvas/post1.position
	
func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_ingreso")):
		$enter.playing = true
		yield(get_tree().create_timer(0.3),"timeout") #tiempo pa que alcance el sonido a salir
		seleccion(true) #me hice cagar tratando de solucionar un error que no era error
		
	if(Input.is_action_just_pressed("tecla_select")):
		$opciones.playing = true
		procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_arriba")):
		$opciones.playing = true
		procesar_opc(false)
	if(Input.is_action_just_pressed("tecla_abajo")):
		$opciones.playing = true
		procesar_opc(true)
		
	
	
#func cambiar_color_botones(boton):
#	$canvas/iniciar.modulate = Color.white
#	$canvas/opciones.modulate = Color.white
#	$canvas/about.modulate = Color.white
#	boton.modulate = Color.red
		
func procesar_opc(aumenta): 
	if(aumenta):
		opc_act += 1
		$opciones.playing = true
	else:
		opc_act -= 1
		$opciones.playing = true
	if(opc_act > 2):
		opc_act = 0
	elif(opc_act<0):
		opc_act= 2	
	if(opc_act == 0):
		$canvas/cursor.rect_position = $canvas/post1.position
		$canvas/iniciar.modulate = Color.red
		$canvas/opciones.modulate = Color.white
		$canvas/about.modulate = Color.white
	elif(opc_act ==1):
		$canvas/cursor.rect_position =  $canvas/post2.position
		$canvas/opciones.modulate = Color.red
		$canvas/iniciar.modulate = Color.white
		$canvas/about.modulate = Color.white
	elif(opc_act ==2):
		$canvas/cursor.rect_position = $canvas/post3.position
		$canvas/about.modulate = Color.red            
		$canvas/iniciar.modulate = Color.white    
		$canvas/opciones.modulate = Color.white

func seleccion(ingreso):
	if(opc_act==0):
		get_tree().change_scene_to(vela1)
	elif(opc_act==1):
		get_tree().change_scene_to(opciones)
	elif(opc_act==2):
		get_tree().change_scene_to(about)
		
			
export (PackedScene) var vela1
export (PackedScene) var opciones
export (PackedScene) var about
