extends Sprite


shader_type canvas_item;

uniform float pixelFactor : hint_range(0,1) = 0.5;

void fragment(){
	vec2 pixelNumber = vec2(textureSize(TEXTURE,0)) * pixelFactor;
	vec2 pixelatedUV = round(UV * pixelNumber) / pixelNumber;
	COLOR = vec4(pixelatedUV.x, pixelatedUV.y, 0,1);
}
