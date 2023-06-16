extends Sprite

var faded := false  
var timer := 0.5     

func _ready():    
	set_process(true) 

func _process(delta):    
	timer -= delta    
	if timer <= 0:        
		faded = !faded        
		timer = 0.5               
	   
	if faded:               
		modulate = Color(1,1,1,0.5)      
	else:
		modulate = Color(1,1,1,1)
