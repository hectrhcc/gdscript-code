extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_pregunta = random_scene_pregunta();
		
func _on_Timer_timeout():
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_pregunta)

#export (PackedScene) var chinita1
	
func random_scene_pregunta() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/pregunta1.tscn",
		   "res://scenes/pregunta2.tscn",
		   "res://scenes/pregunta3.tscn",
		   "res://scenes/pregunta4.tscn",
	]
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
