extends Node

var protointro = load("res://Musica/Ambient.ogg")
var intro = load("res://Musica/INTRO.ogg")
var precog = load("res://Musica/PRECOGNICION.ogg")
var cielo = load("res://Musica/SKY.ogg")

func _ready():
	pass
func musica_protointro():	
	$Musica.stream = protointro
	$Musica.play()

func musica_protointro_stop():
	#$Musica.stream = protointro
	$Musica.stop()


func musica_intro():
	$Musica.stream = intro
	$Musica.play()
	
func musica_intro_stop():
	#$Musica.stream = intro
	$Musica.stop()

func musica_precognicion():
	
	$Musica.stream = precog
	$Musica.play()	

func musica_precognicion_stop():
	
	#$Musica.stream = precog
	$Musica.stop()	

func musica_cielo():
	
	$Musica.stream = cielo
	$Musica.play()	

func musica_cielo_stop():
	
	#$Musica.stream = cielo
	$Musica.stop()	
