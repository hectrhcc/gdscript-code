extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var opc_act = 0
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _physics_process(delta):
	#if(Input.is_action_just_pressed("tecla_select")):
	#	procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_arriba")):
		procesar_opc(false)
	if(Input.is_action_just_pressed("tecla_abajo")):
		procesar_opc(true)
	if(Input.is_action_just_pressed("tecla_ingreso")):
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
		$canvas/label.rect_position = $canvas/Position2D.position
	elif(opc_act ==1):
		$canvas/label.rect_position =  $canvas/Position2D2.position
	elif(opc_act ==2):
		$canvas/label.rect_position = $canvas/Position2D3.position
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func seleccion(enter):
#	if(opc_act==0):
#		get_tree().change_scene_to(vela1)
#	if(opc_act==1):
#		get_tree().change_scene_to(opciones)
#	if(opc_act==2):
#		get_tree().change_scene_to(about)
	pass
#export (PackedScene) var vela1
#export (PackedScene) var opciones
#export (PackedScene) var about
