extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_agradecer = random_scene_agradecer();
		
func _on_Timer_timeout():
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_agradecer)

	
func random_scene_agradecer() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/agra1.tscn",
		   "res://scenes/agra2.tscn",
		   "res://scenes/agra3.tscn",
		   "res://scenes/agra4.tscn",
	]
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
