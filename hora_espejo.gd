extends Control
#guardar la escena donde se interrumpe el flujo
var horastr
var minutosstr
var hora
var minutos
var b = 0
var time = Time.get_time_dict_from_system()
var hour = time.hour
var minutes = time.minute
var tiempo_retorno 
var escena_adan = random_scene_adan();
var escena_lilith = random_scene_lilith();
var escena_sachiel = random_scene_sachiel();
var escena_shamshel = random_scene_shamshel();
var escena_ramiel = random_scene_ramiel();
var escena_gaghiel = random_scene_gaghiel();
var escena_israfel = random_scene_israfel();
var escena_matarael = random_scene_matarael();
var escena_sahaquiel = random_scene_sahaquiel();
var escena_ireul = random_scene_ireul();
var escena_tabris = random_scene_tabris();
var escena_bardiel = random_scene_bardiel();
var escena_azazel = random_scene_azazel();
var escena_elohim = random_scene_elohim();
var escena_seraphin = random_scene_seraphin();
var escena_guardian = random_scene_guardian();
var escena_cassiel = random_scene_cassiel();
var escena_SDXXXSXKXX = random_scene_SDXXXSXKXX();
var escena_metatron = random_scene_metatron();
var escena_jofiel = random_scene_jofiel();
var escena_mahasias = random_scene_mahasias();
var escena_vehuia = random_scene_vehuia();
var escena_sitael = random_scene_sitael();
var escena_achaiah = random_scene_achaiah();
#var time = OS.get_time()
#var time_return = String(time.hour) +":"+String(time.minute)

# Called when the node enters the scene tree for the first time.
func _process(delta):
	hora = int(hour)
	minutos = int(minutes)
	
	if (minutos<10 ):
		minutos = "0"+String(time.minute)
	if(hora<10):
		hora ="0"+String(time.hour)
	#tiempo_retorno = String(hora)+":"+String(minutos)
	horastr = str(hora)
	minutosstr =str(minutos)
#func HoraEspejo():
	if (horastr == "13" and minutosstr=="13"):
		CambioEscena.cambio_escena(escena_adan)
	elif (horastr == "14" and minutosstr=="14"):
		CambioEscena.cambio_escena(escena_lilith)
	elif (horastr == "15" and minutosstr=="15"):
		CambioEscena.cambio_escena(escena_sachiel)
	elif (horastr == "16" and minutosstr=="16"):
		CambioEscena.cambio_escena(escena_shamshel)
	elif (horastr == "17" and minutosstr=="17"):
		CambioEscena.cambio_escena(escena_ramiel)
	elif (horastr == "18" and minutosstr=="25"):
		CambioEscena.cambio_escena(escena_gaghiel)
	elif (horastr =="19" and minutosstr=="19"):
		CambioEscena.cambio_escena(escena_israfel)
	elif (horastr == "20" and minutosstr=="20"):
		CambioEscena.cambio_escena(escena_matarael)
	#borrar el siguiente
	elif (horastr == "18" and minutosstr=="26"):
		CambioEscena.cambio_escena(escena_matarael)
	elif (horastr == "21" and minutosstr=="21"):
		CambioEscena.cambio_escena(escena_sahaquiel)
	elif (horastr == "22" and minutosstr=="22"):
		CambioEscena.cambio_escena(escena_ireul)
	elif (horastr == "23" and minutosstr=="23"):
		CambioEscena.cambio_escena(escena_tabris)
	elif (horastr == "12" and minutosstr=="12"):
		CambioEscena.cambio_escena(escena_bardiel)
	elif (horastr == "01" and minutosstr=="01"):
		CambioEscena.cambio_escena(escena_azazel)
	elif (horastr == "02" and minutosstr=="02"):
		CambioEscena.cambio_escena(escena_elohim)
	elif (horastr == "03" and minutosstr=="03"):
		CambioEscena.cambio_escena(escena_seraphin)
	elif (horastr == "04" and minutosstr=="04"):
		CambioEscena.cambio_escena(escena_guardian)
	elif (horastr == "05" and minutosstr=="05"):
		CambioEscena.cambio_escena(escena_cassiel)
	elif (horastr == "06" and minutosstr=="06"):
		CambioEscena.cambio_escena(escena_SDXXXSXKXX)
	elif (horastr == "07" and minutosstr=="07"):
		CambioEscena.cambio_escena(escena_metatron)
	elif (horastr == "08" and minutosstr=="08"):
		CambioEscena.cambio_escena(escena_jofiel)
	elif (horastr == "09" and minutosstr=="09"):
		CambioEscena.cambio_escena(escena_mahasias)
	elif (horastr == "10" and minutosstr=="10"):
		CambioEscena.cambio_escena(escena_vehuia)
	elif (horastr == "11" and minutosstr=="11"):
		CambioEscena.cambio_escena(escena_sitael)
	elif (horastr == "12" and minutosstr=="12"):
		CambioEscena.cambio_escena(escena_achaiah)

func random_scene_adan() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/adan1.tscn",
		   "res://scenes/adan2.tscn",
		   "res://scenes/adan3.tscn",
		   "res://scenes/adan4.tscn",
		   "res://scenes/adan5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

func random_scene_lilith() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/lilith1.tscn",
		   "res://scenes/lilith2.tscn",
		   "res://scenes/lilith3.tscn",
		   "res://scenes/lilith4.tscn",
		   "res://scenes/lilith.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

func random_scene_sachiel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/sachiel1.tscn",
		   "res://scenes/sachiel2.tscn",
		   "res://scenes/sachiel.tscn",
		   "res://scenes/sachiel4.tscn",
		   "res://scenes/sachiel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]


func random_scene_shamshel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/shamshel1.tscn",
		   "res://scenes/shamshel2.tscn",
		   "res://scenes/shamshel3.tscn",
		   "res://scenes/shamshel4.tscn",
		   "res://scenes/shamshel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
func random_scene_ramiel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/ramiel1.tscn",
		   "res://scenes/ramiel2.tscn",
		   "res://scenes/ramiel3.tscn",
		   "res://scenes/ramiel4.tscn",
		   "res://scenes/ramiel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
func random_scene_gaghiel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/gaghiel1.tscn",
		   "res://scenes/gaghiel2.tscn",
		   "res://scenes/gaghiel3.tscn",
		   "res://scenes/gaghiel4.tscn",
		   "res://scenes/gaghiel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]


func random_scene_israfel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/israfel1.tscn",
		   "res://scenes/israfel2.tscn",
		   "res://scenes/israfel3.tscn",
		   "res://scenes/israfel4.tscn",
		   "res://scenes/israfel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_matarael() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/matarael1.tscn",
		   "res://scenes/matarael2.tscn",
		   "res://scenes/matarael3.tscn",
		   "res://scenes/matarael4.tscn",
		   "res://scenes/matarael5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_sahaquiel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/sahaquiel1.tscn",
		   "res://scenes/sahaquiel2.tscn",
		   "res://scenes/sahaquiel3.tscn",
		   "res://scenes/sahaquiel4.tscn",
		   "res://scenes/sahaquiel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_ireul() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/ireul1.tscn",
		   "res://scenes/ireul2.tscn",
		   "res://scenes/ireul3.tscn",
		   "res://scenes/ireul4.tscn",
		   "res://scenes/ireul5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_tabris() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/tabris1.tscn",
		   "res://scenes/tabris2.tscn",
		   "res://scenes/tabris3.tscn",
		   "res://scenes/tabris4.tscn",
		   "res://scenes/tabris5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_bardiel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/bardiel1.tscn",
		   "res://scenes/bardiel2.tscn",
		   "res://scenes/bardiel3.tscn",
		   "res://scenes/bardiel4.tscn",
		   "res://scenes/bardiel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
func random_scene_azazel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/azazel1.tscn",
		   "res://scenes/azazel2.tscn",
		   "res://scenes/azazel3.tscn",
		   "res://scenes/azazel4.tscn",
		   "res://scenes/azazel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]	

func random_scene_elohim() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/elohim1.tscn",
		   "res://scenes/elohim2.tscn",
		   "res://scenes/elohim3.tscn",
		   "res://scenes/elohim4.tscn",
		   "res://scenes/elohim5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_seraphin() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/seraphin1.tscn",
		   "res://scenes/seraphin2.tscn",
		   "res://scenes/seraphin3.tscn",
		   "res://scenes/seraphin4.tscn",
		   "res://scenes/seraphin5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_guardian() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/guardian1.tscn",
		   "res://scenes/guardian2.tscn",
		   "res://scenes/guardian3.tscn",
		   "res://scenes/guardian4.tscn",
		   "res://scenes/guardian5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
func random_scene_cassiel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/cassiel1.tscn",
		   "res://scenes/cassiel2.tscn",
		   "res://scenes/cassiel3.tscn",
		   "res://scenes/cassiel4.tscn",
		   "res://scenes/cassiel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
	
	
func random_scene_SDXXXSXKXX() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/SDXXXSXKXX1.tscn",
		   "res://scenes/SDXXXSXKXX2.tscn",
		   "res://scenes/SDXXXSXKXX3.tscn",
		   "res://scenes/SDXXXSXKXX4.tscn",
		   "res://scenes/SDXXXSXKXX5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

	
func random_scene_metatron() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/metatron1.tscn",
		   "res://scenes/metatron2.tscn",
		   "res://scenes/metatron3.tscn",
		   "res://scenes/metatron4.tscn",
		   "res://scenes/metatron5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

	
func random_scene_jofiel() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/jofiel1.tscn",
		   "res://scenes/jofiel2.tscn",
		   "res://scenes/jofiel3.tscn",
		   "res://scenes/jofiel4.tscn",
		   "res://scenes/jofiel5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

func random_scene_mahasias() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/mahasias1.tscn",
		   "res://scenes/mahasias2.tscn",
		   "res://scenes/mahasias3.tscn",
		   "res://scenes/mahasias4.tscn",
		   "res://scenes/mahasias5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

func random_scene_vehuia() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/vehuia1.tscn",
		   "res://scenes/vehuia2.tscn",
		   "res://scenes/vehuia3.tscn",
		   "res://scenes/vehuia4.tscn",
		   "res://scenes/vehuia5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

func random_scene_sitael() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/sitael1.tscn",
		   "res://scenes/sitael2.tscn",
		   "res://scenes/sitael3.tscn",
		   "res://scenes/sitael4.tscn",
		   "res://scenes/sitael5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]

func random_scene_achaiah() -> String:
	randomize()
	var scenes_list: Array = [
		   "res://scenes/achaiah1.tscn",
		   "res://scenes/achaiah2.tscn",
		   "res://scenes/achaiah3.tscn",
		   "res://scenes/achaiah4.tscn",
		   "res://scenes/achaiah5.tscn"
	]
	
	return scenes_list[int(rand_range(-1,scenes_list.size()))]
