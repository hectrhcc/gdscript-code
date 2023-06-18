shader_type canvas_item;
const float seed_variation = 0.0;
varying float elapsed_time;

void vertex() {
	elapsed_time = TIME;
}

float dot2(vec2 x) {
	return dot(x, x);
}

float rand(vec2 x) {
    return fract(cos(mod(dot(x, vec2(13.9898, 8.141)), 3.14)) * 43758.5453);
}

vec2 rand2(vec2 x) {
    return fract(cos(mod(vec2(dot(x, vec2(13.9898, 8.141)),
						      dot(x, vec2(3.4562, 17.398))), vec2(3.14))) * 43758.5453);
}

vec3 rand3(vec2 x) {
    return fract(cos(mod(vec3(dot(x, vec2(13.9898, 8.141)),
							  dot(x, vec2(3.4562, 17.398)),
                              dot(x, vec2(13.254, 5.867))), vec3(3.14))) * 43758.5453);
}

vec3 rgb2hsv(vec3 c) {
	vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = c.g < c.b ? vec4(c.bg, K.wz) : vec4(c.gb, K.xy);
	vec4 q = c.r < p.x ? vec4(p.xyw, c.r) : vec4(c.r, p.yzx);

	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float param_rnd(float minimum, float maximum, float seed) {
	return minimum+(maximum-minimum)*rand(vec2(seed));
}vec2 rotate(vec2 uv, float rotate) {
 	vec2 rv;
	rv.x = cos(rotate)*uv.x + sin(rotate)*uv.y;
	rv.y = -sin(rotate)*uv.x + cos(rotate)*uv.y;
    return rv;	
}float fbm_value(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float p00 = rand(mod(o, size));
	float p01 = rand(mod(o + vec2(0.0, 1.0), size));
	float p10 = rand(mod(o + vec2(1.0, 0.0), size));
	float p11 = rand(mod(o + vec2(1.0, 1.0), size));
	p00 = sin(p00 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	p01 = sin(p01 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	p10 = sin(p10 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	p11 = sin(p11 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	vec2 t =  f * f * f * (f * (f * 6.0 - 15.0) + 10.0);
	return mix(mix(p00, p10, t.x), mix(p01, p11, t.x), t.y);
}

float fbm_perlin(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float a00 = rand(mod(o, size)) * 6.28318530718 + offset * 6.28318530718;
	float a01 = rand(mod(o + vec2(0.0, 1.0), size)) * 6.28318530718 + offset * 6.28318530718;
	float a10 = rand(mod(o + vec2(1.0, 0.0), size)) * 6.28318530718 + offset * 6.28318530718;
	float a11 = rand(mod(o + vec2(1.0, 1.0), size)) * 6.28318530718 + offset * 6.28318530718;
	vec2 v00 = vec2(cos(a00), sin(a00));
	vec2 v01 = vec2(cos(a01), sin(a01));
	vec2 v10 = vec2(cos(a10), sin(a10));
	vec2 v11 = vec2(cos(a11), sin(a11));
	float p00 = dot(v00, f);
	float p01 = dot(v01, f - vec2(0.0, 1.0));
	float p10 = dot(v10, f - vec2(1.0, 0.0));
	float p11 = dot(v11, f - vec2(1.0, 1.0));
	vec2 t =  f * f * f * (f * (f * 6.0 - 15.0) + 10.0);
	return 0.5 + mix(mix(p00, p10, t.x), mix(p01, p11, t.x), t.y);
}

float fbm_perlinabs(vec2 coord, vec2 size, float offset, float seed) {
	return abs(2.0*fbm_perlin(coord, size, offset, seed)-1.0);
}

float mod289(float x) {
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

float permute(float x) {
    return mod289(((x * 34.0) + 1.0) * x);
}

vec2 rgrad2(vec2 p, float rot, float seed) {
	float u = permute(permute(p.x) + p.y) * 0.0243902439 + rot; // Rotate by shift
	u = fract(u) * 6.28318530718; // 2*pi
	return vec2(cos(u), sin(u));
}

float fbm_simplex(vec2 coord, vec2 size, float offset, float seed) {
	coord *= 2.0; // needed for it to tile
	coord += rand2(vec2(seed, 1.0-seed)) + size;
	size *= 2.0; // needed for it to tile
	coord.y += 0.001;
    vec2 uv = vec2(coord.x + coord.y*0.5, coord.y);
    vec2 i0 = floor(uv);
    vec2 f0 = fract(uv);
    vec2 i1 = (f0.x > f0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    vec2 p0 = vec2(i0.x - i0.y * 0.5, i0.y);
    vec2 p1 = vec2(p0.x + i1.x - i1.y * 0.5, p0.y + i1.y);
    vec2 p2 = vec2(p0.x + 0.5, p0.y + 1.0);
    i1 = i0 + i1;
    vec2 i2 = i0 + vec2(1.0, 1.0);
    vec2 d0 = coord - p0;
    vec2 d1 = coord - p1;
    vec2 d2 = coord - p2;
    vec3 xw = mod(vec3(p0.x, p1.x, p2.x), size.x);
    vec3 yw = mod(vec3(p0.y, p1.y, p2.y), size.y);
    vec3 iuw = xw + 0.5 * yw;
    vec3 ivw = yw;
    vec2 g0 = rgrad2(vec2(iuw.x, ivw.x), offset, seed);
    vec2 g1 = rgrad2(vec2(iuw.y, ivw.y), offset, seed);
    vec2 g2 = rgrad2(vec2(iuw.z, ivw.z), offset, seed);
    vec3 w = vec3(dot(g0, d0), dot(g1, d1), dot(g2, d2));
    vec3 t = 0.8 - vec3(dot(d0, d0), dot(d1, d1), dot(d2, d2));
    t = max(t, vec3(0.0));
    vec3 t2 = t * t;
    vec3 t4 = t2 * t2;
    float n = dot(t4, w);
    return 0.5 + 5.5 * n;
}

float fbm_cellular(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node =  0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718 * node);
			vec2 diff = neighbor + node - f;
			float dist = length(diff);
			min_dist = min(min_dist, dist);
		}
	}
	return min_dist;
}

float fbm_cellular2(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist1 = 2.0;
	float min_dist2 = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = length(diff);
			if (min_dist1 > dist) {
				min_dist2 = min_dist1;
				min_dist1 = dist;
			} else if (min_dist2 > dist) {
				min_dist2 = dist;
			}
		}
	}
	return min_dist2-min_dist1;
}

float fbm_cellular3(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = abs((diff).x) + abs((diff).y);
			min_dist = min(min_dist, dist);
		}
	}
	return min_dist;
}

float fbm_cellular4(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist1 = 2.0;
	float min_dist2 = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = abs((diff).x) + abs((diff).y);
			if (min_dist1 > dist) {
				min_dist2 = min_dist1;
				min_dist1 = dist;
			} else if (min_dist2 > dist) {
				min_dist2 = dist;
			}
		}
	}
	return min_dist2-min_dist1;
}

float fbm_cellular5(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.5 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = max(abs((diff).x), abs((diff).y));
			min_dist = min(min_dist, dist);
		}
	}
	return min_dist;
}

float fbm_cellular6(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist1 = 2.0;
	float min_dist2 = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = max(abs((diff).x), abs((diff).y));
			if (min_dist1 > dist) {
				min_dist2 = min_dist1;
				min_dist1 = dist;
			} else if (min_dist2 > dist) {
				min_dist2 = dist;
			}
		}
	}
	return min_dist2-min_dist1;
}

// MIT License Inigo Quilez - https://www.shadertoy.com/view/Xd23Dh
float fbm_voronoise( vec2 coord, vec2 size, float offset, float seed) {
    vec2 i = floor(coord) + rand2(vec2(seed, 1.0-seed)) + size;
    vec2 f = fract(coord);
    
	vec2 a = vec2(0.0);
	
    for( int y=-2; y<=2; y++ ) {
    	for( int x=-2; x<=2; x++ ) {
        	vec2  g = vec2( float(x), float(y) );
			vec3  o = rand3( mod(i + g, size) + vec2(seed) );
			o.xy += 0.25 * sin(offset * 6.28318530718 + 6.28318530718*o.xy);
			vec2  d = g - f + o.xy;
			float w = pow( 1.0-smoothstep(0.0, 1.414, length(d)), 1.0 );
			a += vec2(o.z*w,w);
		}
    }
	
    return a.x/a.y;
}vec2 scale(vec2 uv, vec2 center, vec2 scale) {
	uv -= center;
	uv /= scale;
	uv += center;
    return uv;
}float shape_circle(vec2 uv, float sides, float size, float edge) {
    uv = 2.0*uv-1.0;
	edge = max(edge, 1.0e-8);
    float distance = length(uv);
    return clamp((1.0-distance/size)/edge, 0.0, 1.0);
}

float shape_polygon(vec2 uv, float sides, float size, float edge) {
    uv = 2.0*uv-1.0;
	edge = max(edge, 1.0e-8);
    float angle = atan(uv.x, uv.y)+3.14159265359;
    float slice = 6.28318530718/sides;
    return clamp((1.0-(cos(floor(0.5+angle/slice)*slice-angle)*length(uv))/size)/edge, 0.0, 1.0);
}

float shape_star(vec2 uv, float sides, float size, float edge) {
    uv = 2.0*uv-1.0;
	edge = max(edge, 1.0e-8);
    float angle = atan(uv.x, uv.y);
    float slice = 6.28318530718/sides;
    return clamp((1.0-(cos(floor(angle*sides/6.28318530718-0.5+2.0*step(fract(angle*sides/6.28318530718), 0.5))*slice-angle)*length(uv))/size)/edge, 0.0, 1.0);
}

float shape_curved_star(vec2 uv, float sides, float size, float edge) {
    uv = 2.0*uv-1.0;
	edge = max(edge, 1.0e-8);
    float angle = 2.0*(atan(uv.x, uv.y)+3.14159265359);
    float slice = 6.28318530718/sides;
    return clamp((1.0-cos(floor(0.5+0.5*angle/slice)*2.0*slice-angle)*length(uv)/size)/edge, 0.0, 1.0);
}

float shape_rays(vec2 uv, float sides, float size, float edge) {
    uv = 2.0*uv-1.0;
	edge = 0.5*max(edge, 1.0e-8)*size;
	float slice = 6.28318530718/sides;
    float angle = mod(atan(uv.x, uv.y)+3.14159265359, slice)/slice;
    return clamp(min((size-angle)/edge, angle/edge), 0.0, 1.0);
}

vec2 get_from_tileset(float count, float seed, vec2 uv) {
	return clamp((uv+floor(rand2(vec2(seed))*count))/count, vec2(0.0), vec2(1.0));
}

vec2 custom_uv_transform(vec2 uv, vec2 cst_scale, float rnd_rotate, float rnd_scale, vec2 seed) {
	seed = rand2(seed);
	uv -= vec2(0.5);
	float angle = (seed.x * 2.0 - 1.0) * rnd_rotate;
	float ca = cos(angle);
	float sa = sin(angle);
	uv = vec2(ca*uv.x+sa*uv.y, -sa*uv.x+ca*uv.y);
	uv *= (seed.y-0.5)*2.0*rnd_scale+1.0;
	uv /= cst_scale;
	uv += vec2(0.5);
	return uv;
}
float sphere(vec2 uv, vec2 c, float r) {
	uv -= c;
	uv /= r;
	return 2.0*r*sqrt(max(0.0, 1.0-dot(uv, uv)));
}
vec3 blend_normal(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*c1 + (1.0-opacity)*c2;
}

vec3 blend_dissolve(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	if (rand(uv) < opacity) {
		return c1;
	} else {
		return c2;
	}
}

vec3 blend_multiply(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*c1*c2 + (1.0-opacity)*c2;
}

vec3 blend_screen(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*(1.0-(1.0-c1)*(1.0-c2)) + (1.0-opacity)*c2;
}

float blend_overlay_f(float c1, float c2) {
	return (c1 < 0.5) ? (2.0*c1*c2) : (1.0-2.0*(1.0-c1)*(1.0-c2));
}

vec3 blend_overlay(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_overlay_f(c1.x, c2.x), blend_overlay_f(c1.y, c2.y), blend_overlay_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}

vec3 blend_hard_light(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*0.5*(c1*c2+blend_overlay(uv, c1, c2, 1.0)) + (1.0-opacity)*c2;
}

float blend_soft_light_f(float c1, float c2) {
	return (c2 < 0.5) ? (2.0*c1*c2+c1*c1*(1.0-2.0*c2)) : 2.0*c1*(1.0-c2)+sqrt(c1)*(2.0*c2-1.0);
}

vec3 blend_soft_light(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_soft_light_f(c1.x, c2.x), blend_soft_light_f(c1.y, c2.y), blend_soft_light_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}

float blend_burn_f(float c1, float c2) {
	return (c1==0.0)?c1:max((1.0-((1.0-c2)/c1)),0.0);
}

vec3 blend_burn(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_burn_f(c1.x, c2.x), blend_burn_f(c1.y, c2.y), blend_burn_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}

float blend_dodge_f(float c1, float c2) {
	return (c1==1.0)?c1:min(c2/(1.0-c1),1.0);
}

vec3 blend_dodge(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_dodge_f(c1.x, c2.x), blend_dodge_f(c1.y, c2.y), blend_dodge_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}

vec3 blend_lighten(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*max(c1, c2) + (1.0-opacity)*c2;
}

vec3 blend_darken(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*min(c1, c2) + (1.0-opacity)*c2;
}

vec3 blend_difference(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*clamp(c2-c1, vec3(0.0), vec3(1.0)) + (1.0-opacity)*c2;
}

vec3 blend_additive(vec2 uv, vec3 c1, vec3 c2, float oppacity) {
	return c2 + c1 * oppacity;
}

vec3 blend_addsub(vec2 uv, vec3 c1, vec3 c2, float oppacity) {
	return c2 + (c1 - .5) * 2.0 * oppacity;
}const float p_o7368_amount = 0.500000000;
const float p_o7367_cx = 0.000000000;
const float p_o7367_cy = 0.000000000;
const float p_o7367_rotate = -90.000000000;
const float p_o7354_repeat = 1.000000000;
const float p_o7354_rotate = 0.000000000;
const float p_o7354_gradient_0_pos = 0.000000000;
const float p_o7354_gradient_0_r = 0.015924999;
const float p_o7354_gradient_0_g = 0.005447000;
const float p_o7354_gradient_0_b = 0.066405997;
const float p_o7354_gradient_0_a = 1.000000000;
const float p_o7354_gradient_1_pos = 1.000000000;
const float p_o7354_gradient_1_r = 0.095563002;
const float p_o7354_gradient_1_g = 0.025405999;
const float p_o7354_gradient_1_b = 0.433593988;
const float p_o7354_gradient_1_a = 1.000000000;
vec4 o7354_gradient_gradient_fct(float x) {
  if (x < p_o7354_gradient_0_pos) {
    return vec4(p_o7354_gradient_0_r,p_o7354_gradient_0_g,p_o7354_gradient_0_b,p_o7354_gradient_0_a);
  } else if (x < p_o7354_gradient_1_pos) {
    return mix(vec4(p_o7354_gradient_0_r,p_o7354_gradient_0_g,p_o7354_gradient_0_b,p_o7354_gradient_0_a), vec4(p_o7354_gradient_1_r,p_o7354_gradient_1_g,p_o7354_gradient_1_b,p_o7354_gradient_1_a), ((x-p_o7354_gradient_0_pos)/(p_o7354_gradient_1_pos-p_o7354_gradient_0_pos)));
  }
  return vec4(p_o7354_gradient_1_r,p_o7354_gradient_1_g,p_o7354_gradient_1_b,p_o7354_gradient_1_a);
}
const float p_o7353_amount = 0.500000000;
const float p_o7352_default_in1 = 0.000000000;
const float p_o7352_default_in2 = 0.000000000;
const float p_o7325_gradient_0_pos = 0.062363607;
const float p_o7325_gradient_0_r = 1.000000000;
const float p_o7325_gradient_0_g = 1.000000000;
const float p_o7325_gradient_0_b = 1.000000000;
const float p_o7325_gradient_0_a = 1.000000000;
const float p_o7325_gradient_1_pos = 0.225999867;
const float p_o7325_gradient_1_r = 0.634494007;
const float p_o7325_gradient_1_g = 0.617706001;
const float p_o7325_gradient_1_b = 0.675781012;
const float p_o7325_gradient_1_a = 1.000000000;
const float p_o7325_gradient_2_pos = 0.407818465;
const float p_o7325_gradient_2_r = 0.038226999;
const float p_o7325_gradient_2_g = 0.027923999;
const float p_o7325_gradient_2_b = 0.058594000;
const float p_o7325_gradient_2_a = 1.000000000;
const float p_o7325_gradient_3_pos = 0.981817974;
const float p_o7325_gradient_3_r = 0.092482999;
const float p_o7325_gradient_3_g = 0.034790002;
const float p_o7325_gradient_3_b = 0.234375000;
const float p_o7325_gradient_3_a = 1.000000000;
vec4 o7325_gradient_gradient_fct(float x) {
  if (x < p_o7325_gradient_0_pos) {
    return vec4(p_o7325_gradient_0_r,p_o7325_gradient_0_g,p_o7325_gradient_0_b,p_o7325_gradient_0_a);
  } else if (x < p_o7325_gradient_1_pos) {
    return mix(vec4(p_o7325_gradient_0_r,p_o7325_gradient_0_g,p_o7325_gradient_0_b,p_o7325_gradient_0_a), vec4(p_o7325_gradient_1_r,p_o7325_gradient_1_g,p_o7325_gradient_1_b,p_o7325_gradient_1_a), ((x-p_o7325_gradient_0_pos)/(p_o7325_gradient_1_pos-p_o7325_gradient_0_pos)));
  } else if (x < p_o7325_gradient_2_pos) {
    return mix(vec4(p_o7325_gradient_1_r,p_o7325_gradient_1_g,p_o7325_gradient_1_b,p_o7325_gradient_1_a), vec4(p_o7325_gradient_2_r,p_o7325_gradient_2_g,p_o7325_gradient_2_b,p_o7325_gradient_2_a), ((x-p_o7325_gradient_1_pos)/(p_o7325_gradient_2_pos-p_o7325_gradient_1_pos)));
  } else if (x < p_o7325_gradient_3_pos) {
    return mix(vec4(p_o7325_gradient_2_r,p_o7325_gradient_2_g,p_o7325_gradient_2_b,p_o7325_gradient_2_a), vec4(p_o7325_gradient_3_r,p_o7325_gradient_3_g,p_o7325_gradient_3_b,p_o7325_gradient_3_a), ((x-p_o7325_gradient_2_pos)/(p_o7325_gradient_3_pos-p_o7325_gradient_2_pos)));
  }
  return vec4(p_o7325_gradient_3_r,p_o7325_gradient_3_g,p_o7325_gradient_3_b,p_o7325_gradient_3_a);
}
const float p_o7350_cx = 0.185000000;
const float p_o7350_cy = -0.050000000;
const float p_o7350_scale_x = 1.870000000;
const float p_o7350_scale_y = 1.180000000;
const float p_o7324_translate_y = -0.005000000;
const float p_o134073_gradient_0_pos = 0.154545455;
const float p_o134073_gradient_0_r = 0.704777956;
const float p_o134073_gradient_0_g = 0.699096680;
const float p_o134073_gradient_0_b = 0.718750000;
const float p_o134073_gradient_0_a = 1.000000000;
const float p_o134073_gradient_1_pos = 0.463636468;
const float p_o134073_gradient_1_r = 0.371093750;
const float p_o134073_gradient_1_g = 0.355148315;
const float p_o134073_gradient_1_b = 0.355148315;
const float p_o134073_gradient_1_a = 1.000000000;
const float p_o134073_gradient_2_pos = 0.936363498;
const float p_o134073_gradient_2_r = 0.038226999;
const float p_o134073_gradient_2_g = 0.027923999;
const float p_o134073_gradient_2_b = 0.058594000;
const float p_o134073_gradient_2_a = 1.000000000;
const float p_o134073_gradient_3_pos = 1.000000000;
const float p_o134073_gradient_3_r = 0.092482999;
const float p_o134073_gradient_3_g = 0.034790002;
const float p_o134073_gradient_3_b = 0.234375000;
const float p_o134073_gradient_3_a = 1.000000000;
vec4 o134073_gradient_gradient_fct(float x) {
  if (x < p_o134073_gradient_0_pos) {
    return vec4(p_o134073_gradient_0_r,p_o134073_gradient_0_g,p_o134073_gradient_0_b,p_o134073_gradient_0_a);
  } else if (x < p_o134073_gradient_1_pos) {
    return mix(vec4(p_o134073_gradient_0_r,p_o134073_gradient_0_g,p_o134073_gradient_0_b,p_o134073_gradient_0_a), vec4(p_o134073_gradient_1_r,p_o134073_gradient_1_g,p_o134073_gradient_1_b,p_o134073_gradient_1_a), ((x-p_o134073_gradient_0_pos)/(p_o134073_gradient_1_pos-p_o134073_gradient_0_pos)));
  } else if (x < p_o134073_gradient_2_pos) {
    return mix(vec4(p_o134073_gradient_1_r,p_o134073_gradient_1_g,p_o134073_gradient_1_b,p_o134073_gradient_1_a), vec4(p_o134073_gradient_2_r,p_o134073_gradient_2_g,p_o134073_gradient_2_b,p_o134073_gradient_2_a), ((x-p_o134073_gradient_1_pos)/(p_o134073_gradient_2_pos-p_o134073_gradient_1_pos)));
  } else if (x < p_o134073_gradient_3_pos) {
    return mix(vec4(p_o134073_gradient_2_r,p_o134073_gradient_2_g,p_o134073_gradient_2_b,p_o134073_gradient_2_a), vec4(p_o134073_gradient_3_r,p_o134073_gradient_3_g,p_o134073_gradient_3_b,p_o134073_gradient_3_a), ((x-p_o134073_gradient_2_pos)/(p_o134073_gradient_3_pos-p_o134073_gradient_2_pos)));
  }
  return vec4(p_o134073_gradient_3_r,p_o134073_gradient_3_g,p_o134073_gradient_3_b,p_o134073_gradient_3_a);
}
const float seed_o114330 = 0.000000000;
const float p_o114330_scale_x = 15.000000000;
const float p_o114330_scale_y = 15.000000000;
const float p_o114330_folds = 0.000000000;
const float p_o114330_iterations = 3.000000000;
const float p_o114330_persistence = 0.700000000;
const float p_o114330_offset = 0.160000000;
float o114330_fbm(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed, float _seed_variation_) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = fbm_voronoise(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
const float seed_o7341 = 0.000000000;
const float p_o7341_count = 25.000000000;
const float p_o7341_scale_x = 0.370000000;
const float p_o7341_scale_y = 0.310000000;
const float p_o7341_rotate = 39.000000000;
const float p_o7341_value = 0.520000000;
const float p_o7340_sides = 5.000000000;
const float p_o7340_radius = 0.010000000;
const float p_o7340_edge = 0.040000000;
float o7341_input_in(vec2 uv, float _seed_variation_) {
float o7340_0_1_f = shape_star((uv), p_o7340_sides, p_o7340_radius*1.0, p_o7340_edge*1.0);

return o7340_0_1_f;
}
float o7341_input_mask(vec2 uv, float _seed_variation_) {

return 1.0;
}
vec4 splatter_o7341(vec2 uv, int count, inout vec3 instance_uv, vec2 seed, float _seed_variation_) {
	float c = 0.0;
	vec3 rc = vec3(0.0);
	vec3 rc1;
	for (int i = 0; i < count; ++i) {
		seed = rand2(seed);
		rc1 = rand3(seed);
		float mask = o7341_input_mask(fract(seed+vec2(0.5)), _seed_variation_);
		if (mask > 0.01) {
			vec2 pv = fract(uv - seed)-vec2(0.5);
			seed = rand2(seed);
			float angle = (seed.x * 2.0 - 1.0) * p_o7341_rotate * 0.01745329251;
			float ca = cos(angle);
			float sa = sin(angle);
			pv = vec2(ca*pv.x+sa*pv.y, -sa*pv.x+ca*pv.y);
			pv *= (seed.y-0.5)*2.0*(0.3*sin(elapsed_time))+1.0;
			pv /= vec2(p_o7341_scale_x, p_o7341_scale_y);
			pv += vec2(0.5);
			seed = rand2(seed);
			vec2 clamped_pv = clamp(pv, vec2(0.0), vec2(1.0));
			if (pv.x != clamped_pv.x || pv.y != clamped_pv.y) {
				continue;
			}
			vec2 full_uv = pv;
			pv = get_from_tileset( 1.0, seed.x, pv);
			float c1 = o7341_input_in(pv, false ? seed.x : 0.0)*mask*(1.0-p_o7341_value*seed.x);
			c = max(c, c1);
			rc = mix(rc, rc1, step(c, c1));
			instance_uv = mix(instance_uv, vec3(full_uv, seed.x), step(c, c1));
		}
	}
	return vec4(rc, c);
}
const float p_o7345_default_in1 = 0.000000000;
const float p_o7345_default_in2 = 0.000000000;
const float p_o7351_amount = 0.740000000;
const float p_o7349_default_in1 = 0.000000000;
const float p_o7349_default_in2 = 0.000000000;
const float p_o7369_translate_x = 0.000000000;
const float p_o7369_translate_y = 0.000000000;
const float p_o7348_default_in1 = 0.000000000;
const float p_o7348_default_in2 = 0.000000000;
const float p_o7346_sides = 11.000000000;
const float p_o7346_radius = 0.170000000;
const float p_o7346_edge = 0.240000000;
const float p_o7347_cx = 0.500000000;
const float p_o7347_cy = 0.500000000;
const float p_o7347_r = 0.190000000;

void fragment() {
float _seed_variation_ = seed_variation;
vec2 o7367_0_c = vec2(0.5+p_o7367_cx, 0.5+p_o7367_cy);float o7354_0_r = 0.5+(cos(p_o7354_rotate*0.01745329251)*((rotate((UV)-o7367_0_c, p_o7367_rotate*0.01745329251)+o7367_0_c).x-0.5)+sin(p_o7354_rotate*0.01745329251)*((rotate((UV)-o7367_0_c, p_o7367_rotate*0.01745329251)+o7367_0_c).y-0.5))/(cos(abs(mod(p_o7354_rotate, 90.0)-45.0)*0.01745329251)*1.41421356237);vec4 o7354_0_1_rgba = o7354_gradient_gradient_fct(fract(o7354_0_r*p_o7354_repeat));
vec4 o7367_0_1_rgba = o7354_0_1_rgba;
float o114330_0_1_f = o114330_fbm(((scale((UV), vec2(0.5+p_o7350_cx, 0.5+p_o7350_cy), vec2(p_o7350_scale_x, p_o7350_scale_y)))-vec2((elapsed_time*0.01), p_o7324_translate_y)), vec2(p_o114330_scale_x, p_o114330_scale_y), int(p_o114330_folds), int(p_o114330_iterations), p_o114330_persistence, p_o114330_offset, (seed_o114330+fract(_seed_variation_)), _seed_variation_);
vec4 o134073_0_1_rgba = o134073_gradient_gradient_fct(o114330_0_1_f);
vec4 o7324_0_1_rgba = o134073_0_1_rgba;
vec4 o7350_0_1_rgba = o7324_0_1_rgba;
vec4 o7325_0_1_rgba = o7325_gradient_gradient_fct((dot((o7350_0_1_rgba).rgb, vec3(1.0))/3.0));
vec3 o7341_0_instance_uv = vec3(0.0);
vec4 o7341_0_rch = splatter_o7341((UV), int(p_o7341_count), o7341_0_instance_uv, vec2(float((seed_o7341+fract(_seed_variation_)))), _seed_variation_);float o7341_0_1_f = o7341_0_rch.a;
float o7352_0_clamp_false = (dot((o7325_0_1_rgba).rgb, vec3(1.0))/3.0)+o7341_0_1_f;
float o7352_0_clamp_true = clamp(o7352_0_clamp_false, 0.0, 1.0);
float o7352_0_1_f = o7352_0_clamp_false;
float o7346_0_1_f = shape_circle(((UV)-vec2(p_o7369_translate_x, p_o7369_translate_y)), p_o7346_sides, p_o7346_radius*1.0, p_o7346_edge*1.0);
float o7347_0_1_f = sphere(((UV)-vec2(p_o7369_translate_x, p_o7369_translate_y)), vec2(p_o7347_cx, p_o7347_cy), p_o7347_r);
float o7348_0_clamp_false = o7346_0_1_f+o7347_0_1_f;
float o7348_0_clamp_true = clamp(o7348_0_clamp_false, 0.0, 1.0);
float o7348_0_1_f = o7348_0_clamp_false;
vec4 o7369_0_1_rgba = vec4(vec3(o7348_0_1_f), 1.0);
float o7349_0_clamp_false = p_o7349_default_in1+(dot((o7369_0_1_rgba).rgb, vec3(1.0))/3.0);
float o7349_0_clamp_true = clamp(o7349_0_clamp_false, 0.0, 1.0);
float o7349_0_2_f = o7349_0_clamp_false;
vec4 o7351_0_s1 = o7325_0_1_rgba;
vec4 o7351_0_s2 = vec4(vec3(o7349_0_2_f), 1.0);
float o7351_0_a = p_o7351_amount*1.0;
vec4 o7351_0_2_rgba = vec4(blend_difference((UV), o7351_0_s1.rgb, o7351_0_s2.rgb, o7351_0_a*o7351_0_s1.a), min(1.0, o7351_0_s2.a+o7351_0_a*o7351_0_s1.a));
float o7345_0_clamp_false = (dot((o7351_0_2_rgba).rgb, vec3(1.0))/3.0)+o7341_0_1_f;
float o7345_0_clamp_true = clamp(o7345_0_clamp_false, 0.0, 1.0);
float o7345_0_1_f = o7345_0_clamp_false;
vec4 o7353_0_s1 = vec4(vec3(o7352_0_1_f), 1.0);
vec4 o7353_0_s2 = vec4(vec3(o7345_0_1_f), 1.0);
float o7353_0_a = p_o7353_amount*1.0;
vec4 o7353_0_2_rgba = vec4(blend_normal((UV), o7353_0_s1.rgb, o7353_0_s2.rgb, o7353_0_a*o7353_0_s1.a), min(1.0, o7353_0_s2.a+o7353_0_a*o7353_0_s1.a));
vec4 o7368_0_s1 = o7367_0_1_rgba;
vec4 o7368_0_s2 = o7353_0_2_rgba;
float o7368_0_a = p_o7368_amount*1.0;
vec4 o7368_0_2_rgba = vec4(blend_normal((UV), o7368_0_s1.rgb, o7368_0_s2.rgb, o7368_0_a*o7368_0_s1.a), min(1.0, o7368_0_s2.a+o7368_0_a*o7368_0_s1.a));
COLOR = o7368_0_2_rgba;
}