extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_entidad = random_scene_entidad();
		
func _on_Timer_timeout():
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_entidad)

	
func random_scene_entidad() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/ent1.tscn",
		   "res://scenes/ent2.tscn",
		   "res://scenes/ent3.tscn",
		   "res://scenes/ent4.tscn",
	]
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
