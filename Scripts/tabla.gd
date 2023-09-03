extends Control

func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_ingreso")):
		$select.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
		seleccion(true)
	elif(Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")):
		$opciones.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
	
func seleccion(enter):
	if(opcion_actual==0 ):
		CambioEscena.cambio_escena("res://scenes/randompregunta.tscn")
	elif(opcion_actual==1 ):		
		CambioEscena.cambio_escena("res://scenes/randomagradecer.tscn")
	elif(opcion_actual==2):
		CambioEscena.cambio_escena("res://scenes/randominfo.tscn")
	elif(opcion_actual==3):
		MusicaControl.musica_intro()
		CambioEscena.cambio_escena("res://scenes/opciones9talentos.tscn")
	elif(opcion_actual==4):
		CambioEscena.cambio_escena("res://scenes/randomsi.tscn")
	elif(opcion_actual==5):
		CambioEscena.cambio_escena("res://scenes/randomno.tscn")
			

func _ready():
	pass


func _process(delta):
	pass
	
func actualizar_colores_opciones():
	for i in range(opciones.size()):
		var label = get_node(opciones[i])
		if i == opcion_actual:
			label.add_color_override("font_color", Color("#e51a4c"))
		else:
			label.add_color_override("font_color", Color("#FFFFFF"))
			
func actualizar_opcion_actual(nueva_opcion):
	opcion_actual = nueva_opcion
	if opcion_actual < 0:
		opcion_actual = get_child_count() - 1
	elif opcion_actual >= get_child_count():
		opcion_actual = 0
	actualizar_colores_opciones()


var opciones = ["???", "agradecer", "info", "salir","si","no"]
var opcion_actual = 0
func _input(event):
	if event.is_action_pressed("ui_up"):
		if opcion_actual == 0:
			opcion_actual = opciones.size() - 1
		else:
			opcion_actual -= 1
	elif event.is_action_pressed("ui_down"):
		if opcion_actual == opciones.size() - 1:
			opcion_actual = 0
		else:
			opcion_actual += 1
	elif event.is_action_pressed("ui_right"):
		if opcion_actual == 2:
			opcion_actual = 5
		elif opcion_actual == 4:
			opcion_actual = 2
	elif event.is_action_pressed("ui_left"):
		if opcion_actual == 5:
			opcion_actual = 2
		elif opcion_actual == 2:
			opcion_actual = 4

	actualizar_colores_opciones()
