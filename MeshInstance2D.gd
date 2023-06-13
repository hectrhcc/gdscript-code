extends MeshInstance2D


var b = 1
var time = Time.get_time_dict_from_system()
#var timeDict = OS.get_time();
#var time = Time.get_time_string_from_system()
#var hora = timeDict.hour;
#var minutos = timeDict.minute;
var hour = time.hour
var minutes = time.minute
var tiempo_retorno
var hora
var minutos

func _process(delta): #no cambiar el nombre de la funcion
	hora = int(hour)
	minutos = int(minutes)
	if (minutos<10 ):
		minutos = "0"+String(time.minute)		
	if(hora<10):
		hora = "0"+String(time.hour)	
	else:
		tiempo_retorno = String(time.hour) +":"+String(time.minute)
	tiempo_retorno = String(hora)+":"+String(minutos)
	b = tiempo_retorno
