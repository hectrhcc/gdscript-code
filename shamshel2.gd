extends Control

func _process(delta):
	$hora.text = str($MeshInstance2D.b) 

func _physics_process(delta):
	MiSingleton._salir()
func _on_Timer_timeout():
	pass # Replace with function body.
#aqui hay que volver a la escena que estabamos antes
