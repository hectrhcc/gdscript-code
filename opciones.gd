extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _physics_process(delta):
	MiSingleton._salir()
	if(Input.is_action_just_pressed("tecla_ingreso")):
		$select.playing = true
		yield(get_tree().create_timer(0.3),"timeout")
		seleccion(true)
func seleccion(enter):
	#get_tree().change_scene_to(intro)
		#get_tree().change_scene_to(intro)
		#export (String, FILE,"res://scenes/intro.tscn") var intro
	#export(String, FILE, "res://scenes/intro.tscn") var level 
	CambioEscena.cambio_escena("res://scenes/menuprincipal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#self.position = get_viewport_rect().size/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	#if $sonido.pressed:
		#get_tree().change_scene_to(sonido)
	#	pass
	
	#if $guardar.pressed:
	#	pass
	if $volver.pressed:
		CambioEscena.cambio_escena("res://scenes/menuprincipal.tscn")	

