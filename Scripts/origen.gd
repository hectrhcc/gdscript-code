extends Control

func _ready():
	yield(get_tree().create_timer(1),"timeout")
	MusicaControl.musica_protointro()
	
func _on_Timer_timeout():
	CambioEscena.cambio_escena("res://scenes/protointro.tscn")


