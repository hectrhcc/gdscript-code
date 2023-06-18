extends Node

func _ready():
	$Logon.set_pixel_factor(0.5)

func reset_shader():
	$Logon.reset_shader()
