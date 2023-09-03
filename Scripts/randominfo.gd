extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_info = random_scene_info();
		
func _on_Timer_timeout():
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_info)

	
func random_scene_info() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/info1.tscn",
		   "res://scenes/info2.tscn",
		   "res://scenes/info3.tscn",
		   "res://scenes/info4.tscn",
	]
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
