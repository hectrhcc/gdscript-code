extends Control

#class_name  ruta_escena

#var ruta_escena = "res://scenes/intro.tscn"



const CHAR_READ_RATE = 0.05
onready var textbox_container =$CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2
onready var label3 =$CanvasLayer/MarginContainer/Panel/Label3
	
func _ready():	
	hide_textbox()
	add_text("Los Nueve Talentos", "                   es un Artefacto Digital de Autoexploración Mágica\nun software interactivo con el cual puedes adentrarte\n en el camino hacia           ","El Misterio")
	
func hide_textbox():
	label.text=""
	label2.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text,next_text2,next_text3 ):
	label.text = next_text
	label2.text = next_text2
	label3.text = next_text3
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(next_text2) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween3.interpolate_property(label3,"percent_visible",0.0, 1.0, len(next_text3) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	if ($CanvasLayer/Tween.is_active()):
		$CanvasLayer/Tween2.stop(label2)
		$CanvasLayer/Tween3.stop(label3)
	yield($CanvasLayer/Tween, "tween_completed") #gracias, esto sirve pa detener y pa las señales en este caso de que tween termino
	$CanvasLayer/Tween2.start()
	yield($CanvasLayer/Tween2, "tween_completed") 
	$CanvasLayer/Tween3.start()
	

func _physics_process(delta):
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
func _process(delta):
	if $CanvasLayer/continuar.pressed:
#		get_tree().change_scene_to(intro)
#	pass
		CambioEscena.cambio_escena("res://scenes/menuprincipal.tscn")			
	#return niveles.get(enter)#	musica_fondo.musica_fondo(musica_fondo)
#func get_level(p_name):
	#return intro
#export(String) var L1
	 
	
#export (PackedScene) var intro
#export(String) niveles L1 # example value: "L1"
#export (String, FILE) var L1
#export (String, FILE,"res://scenes/intro.tscn") var intro
