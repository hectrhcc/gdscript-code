shader_type canvas_item;

uniform sampler2D TEXTURE;

uniform float pixelSize = 20.0;

void fragment() {
    vec2 pixelUV = floor(vec2(UV.x * (1.0 / pixelSize), UV.y * (1.0 / pixelSize)));
    pixelUV = pixelUV / vec2(1.0 / pixelSize); 
    COLOR = texture(TEXTURE, pixelUV);    
}