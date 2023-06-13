extends Control

func _ready():
	MusicaControl.musica_protointro()
	
func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/protointro.tscn")


