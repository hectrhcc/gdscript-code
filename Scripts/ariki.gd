extends Control


func _ready():
	MusicaControl.musica_protointro_stop()
	#yield(get_tree().create_timer(0.999),"timeout")
	$ini.playing =true
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(5),"timeout")
	$AnimationPlayer.play("fade out")
	yield(get_tree().create_timer(2.55),"timeout")
	get_tree().change_scene("res://scenes/intro.tscn")
