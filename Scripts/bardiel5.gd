extends Control

var escena_guardada = MiSingleton.escena_guardada
var ruta_escena = "res://scenes/"+escena_guardada+".tscn" 

func _process(delta):
	$hora.text = str($MeshInstance2D.b) 


func _on_Timer_timeout():
	CambioEscena.cambio_escena(ruta_escena)
	
