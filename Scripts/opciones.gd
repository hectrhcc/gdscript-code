extends Control
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_ingreso")):
		$select.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
		seleccion(true)
	elif(Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")):
		$opciones.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
	
func seleccion(enter):
	if(opcion_actual==1 and cancion_actual==0):
		$canciones/intro.playing=true
		$canciones/precognicion.playing=false
		$canciones/magia.playing=false
		$canciones/dreams.playing=false
		$canciones/sky.playing=false
		$canciones/dialogue.playing=false
		MusicaControl.musica_intro_stop()
	elif(opcion_actual==1 and cancion_actual==1):
		$canciones/intro.playing=false
		$canciones/precognicion.playing=true
		$canciones/magia.playing=false
		$canciones/dreams.playing=false
		$canciones/sky.playing=false
		$canciones/dialogue.playing=false
		MusicaControl.musica_intro_stop()
	elif(opcion_actual==1 and cancion_actual==2):
		$canciones/intro.playing=false
		$canciones/precognicion.playing=false
		$canciones/magia.playing=true
		$canciones/dreams.playing=false
		$canciones/sky.playing=false
		$canciones/dialogue.playing=false
		MusicaControl.musica_intro_stop()
	elif(opcion_actual==1 and cancion_actual==3):
		$canciones/intro.playing=false
		$canciones/precognicion.playing=false
		$canciones/magia.playing=false
		$canciones/dreams.playing=true
		$canciones/sky.playing=false
		$canciones/dialogue.playing=false
		MusicaControl.musica_intro_stop()
	elif(opcion_actual==1 and cancion_actual==4):
		$canciones/intro.playing=false
		$canciones/precognicion.playing=false
		$canciones/magia.playing=false
		$canciones/dreams.playing=false
		$canciones/sky.playing=true
		$canciones/dialogue.playing=false
		MusicaControl.musica_intro_stop()
	elif(opcion_actual==1 and cancion_actual==5):
		$canciones/intro.playing=false
		$canciones/precognicion.playing=false
		$canciones/magia.playing=false
		$canciones/dreams.playing=false
		$canciones/sky.playing=false
		$canciones/dialogue.playing=true
		MusicaControl.musica_intro_stop()
	elif(opcion_actual==3):
		#aqui tengo que guardar el volumen
		AudioServer.set_bus_volume_db(0, volumen - 100)
	elif(opcion_actual==4):
		MusicaControl.musica_intro()
		CambioEscena.cambio_escena("res://scenes/menuprincipal.tscn")
			
	#get_tree().change_scene_to(intro)
		#get_tree().change_scene_to(intro)
		#export (String, FILE,"res://scenes/intro.tscn") var intro
	#export(String, FILE, "res://scenes/intro.tscn") var level 
#	CambioEscena.cambio_escena("res://scenes/menuprincipal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#self.position = get_viewport_rect().size/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
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
	
#func _input(event):
#	if event.is_action_pressed("ui_up"):
#		opcion_actual -= 1
#	elif event.is_action_pressed("ui_down"):
#		opcion_actual += 1

#	if opcion_actual < 0:
#		opcion_actual = opciones.size() - 1
#	elif opcion_actual >= opciones.size():
#		opcion_actual = 0
#	actualizar_colores_opciones()
#func _input(event):
#	if event.is_action_pressed("ui_up"):
#		if opcion_actual == 0:
#			opcion_actual = opciones.size() - 1
#		else:
#			opcion_actual -= 1
#	elif event.is_action_pressed("ui_down"):
#		if opcion_actual == opciones.size() - 1:
#			opcion_actual = 0
#		else:
#			opcion_actual += 1
#	elif event.is_action_pressed("ui_right") or event.is_action_pressed("ui_left"):
#		if opcion_actual == opciones.size() - 2:
#			opcion_actual = opciones.size() - 1
#		elif opcion_actual == opciones.size() - 1:
#			opcion_actual = opciones.size() - 2

#	actualizar_colores_opciones()

var opciones = ["controles", "canciones", "volumen2", "guardar", "atras"]
var opcion_actual = 0
var canciones = ["Intro", "Precognicion", "Magia","Sueños","Sky","A Dialogue"]
var cancion_actual = 0
var volumen =80
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
	elif event.is_action_pressed("ui_right") or event.is_action_pressed("ui_left"):
		if opcion_actual == opciones.size() - 2:
			opcion_actual = opciones.size() - 1
		elif opcion_actual == opciones.size() - 1:
			opcion_actual = opciones.size() - 2

	actualizar_colores_opciones()

	if opcion_actual == 2:
		if event.is_action_pressed("ui_left") and volumen > 0:
			volumen -= 1
		elif event.is_action_pressed("ui_right") and volumen < 100:
			volumen += 1
		$volumen.set_text(str(volumen))
	
	if opcion_actual == 1:#opcion de canciones
		if event.is_action_pressed("ui_left") and cancion_actual > 0:
			cancion_actual -= 1
		elif event.is_action_pressed("ui_right") and cancion_actual < canciones.size() - 1:
			cancion_actual += 1
		elif event.is_action_pressed("ui_right") and cancion_actual == canciones.size() - 1:
			cancion_actual = 0
		elif event.is_action_pressed("ui_left") and cancion_actual == 0: 
			cancion_actual = canciones.size() - 1  # Ir al final
		
	if opcion_actual == 1:
		$cancion.set_text(canciones[cancion_actual])
	elif opcion_actual == 2:
		$volumen.set_text(str(volumen))
		AudioServer.set_bus_volume_db(0, volumen - 100)
