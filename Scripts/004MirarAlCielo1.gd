extends Sprite

var pixelFactor = 0

func _ready():
	var shaderMaterial = ShaderMaterial.new()
	shaderMaterial.shader = load("res://shaders/pixelar.shader")
	material = shaderMaterial
	
	var tween = Tween.new()
	add_child(tween)

	tween.interpolate_property(shaderMaterial, "shader_param/pixelFactor", 0, 1, 5, Tween.TRANS_QUAD, Tween.EASE_IN)
	tween.start()
