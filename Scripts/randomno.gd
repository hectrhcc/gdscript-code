extends Control

const CHAR_READ_RATE = 0.05
var iniciorandom_no = random_scene_no();
		
func _on_Timer_timeout():
	#get_tree().change_scene_to(chinita1)
	CambioEscena.cambio_escena(iniciorandom_no)

	
func random_scene_no() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/no1.tscn",
		   "res://scenes/no2.tscn",
		   "res://scenes/no3.tscn",
		   "res://scenes/no4.tscn",
	]
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
