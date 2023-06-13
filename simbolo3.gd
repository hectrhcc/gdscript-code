extends Control
var iniciorandom_simbolos = random_scene_simbolos();
func _physics_process(delta):
	MiSingleton._salir()
func random_scene_simbolos() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/a.tscn",
		   "res://scenes/b.tscn",
		   "res://scenes/c.tscn",
		   "res://scenes/d.tscn",
		   "res://scenes/e.tscn",
		   "res://scenes/f.tscn",
		   "res://scenes/g.tscn",
		   "res://scenes/h.tscn",
		   "res://scenes/i.tscn",
		   "res://scenes/j.tscn",
		   "res://scenes/k.tscn"
	]	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]


func _on_Timer_timeout():
	CambioEscena.cambio_escena(iniciorandom_simbolos)
