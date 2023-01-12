extends Control

func _on_Timer_timeout():
	get_tree().change_scene_to(sabiduria2)

export (PackedScene) var sabiduria2
