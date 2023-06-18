extends Node

var music_player := AudioStreamPlayer.new()


func _ready():
	add_child(music_player)


func play_music(music_stream):
	music_player.stream = music_stream
	music_player.play()


func stop_music():
	music_player.stop()
