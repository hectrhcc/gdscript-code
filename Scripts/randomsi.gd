extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_si = random_scene_si();
		
func _on_Timer_timeout():
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_si)

	
func random_scene_si() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/si1.tscn",
		   "res://scenes/si2.tscn",
		   "res://scenes/si3.tscn",
		   "res://scenes/si4.tscn",
	]
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
