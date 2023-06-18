extends Node

var escena_guardada
var contador =0
var Estado_Hora = true

func _ready():
	# Ocultar el cursor del sistema operativo
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

#func _salir():
#	if(Input.is_action_just_pressed('tecla_escape')):
#		get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

#   if event.is_action_pressed("ui_select"):
#		CambioEscena.cambio_escena("res://scenes/inventario.tscn")	
