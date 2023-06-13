extends Label

func _hora_mirror():

	#var time = OS.get_time()
	#var time_return = String(time.hour) +":"+String(time.minute)+":"+String(time.second)
	#text = var2str(time)
	var time = Time.get_time_dict_from_system()
	#text = str(time)
	# we can use format strings to pad it to a length of 2 with zeros, e.g. 01:20:12
	print("%02d:%02d" % [time.hour, time.minute])
	
