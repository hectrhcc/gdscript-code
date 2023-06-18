extends Control


func _ready():
	MusicaControl.musica_protointro_stop()
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(6),"timeout")
	$AnimationPlayer.play("fade out")
	yield(get_tree().create_timer(2.3),"timeout")
	get_tree().change_scene("res://scenes/intro.tscn")
