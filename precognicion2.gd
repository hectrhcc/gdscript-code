extends Control


const CHAR_READ_RATE = 0.05

onready var textbox_container = $CanvasLayer/MarginContainer
onready var label =$CanvasLayer/MarginContainer/Panel/Label
onready var label2 =$CanvasLayer/MarginContainer/Panel/Label2
onready var label3 =$CanvasLayer/MarginContainer/Panel/Label3

func _ready():
	hide_textbox()
	add_text("para continuar con tu camino\ndeberas elegir entre las opciones:","ANIMAL","MEMORIA")
	
func hide_textbox():
	label.text=""
	label2.text=""
	label3.text=""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(text,animal,memoria):
	label.text = text
	label2.text = animal
	label3.text = memoria
	show_textbox()
	$CanvasLayer/Tween.interpolate_property(label,"percent_visible",0.0, 1.0, len(text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween2.interpolate_property(label2,"percent_visible",0.0, 1.0, len(animal) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween3.interpolate_property(label3,"percent_visible",0.0, 1.0, len(memoria) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$CanvasLayer/Tween.start()
	if ($CanvasLayer/Tween.is_active()):
		$CanvasLayer/Tween2.stop(label2)
		$CanvasLayer/Tween3.stop(label3)
	yield($CanvasLayer/Tween, "tween_completed") #gracias, esto sirve pa detener y pa las señales en este caso de que tween termino
	$CanvasLayer/Tween2.start()
	yield($CanvasLayer/Tween2, "tween_completed") 
	$CanvasLayer/Tween3.start()
	

var opc_act = 0
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _physics_process(delta):
	#if(Input.is_action_just_pressed("tecla_select")):
		#procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_izquierda")):
		$opciones.playing = true
		procesar_opc(false)
	if(Input.is_action_just_pressed("tecla_derecha")):
		$opciones.playing = true
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
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos1.position
	elif(opc_act ==1):
		$CanvasLayer/cursor.rect_position = $CanvasLayer/pos2.position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func seleccion(enter):
	if(opc_act==0):
		get_tree().change_scene_to(animal)
	if(opc_act==1):
		get_tree().change_scene_to(memoria)

#func _process(delta):  esto lo comente porque no hay botones, es una imagen
#	if $canvas/iniciar.pressed:
#		get_tree().change_scene_to(animal)
#	if $canvas/opciones.pressed:
#		get_tree().change_scene_to(memoria)

			
export (PackedScene) var animal
export (PackedScene) var memoria
