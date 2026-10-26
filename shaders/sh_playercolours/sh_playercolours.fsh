//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_outline;
uniform vec3 u_tint;
uniform vec3 u_skin;
uniform vec3 u_cloth;
uniform float u_silo;

void main()
{
	vec4 base = texture2D(gm_BaseTexture, v_vTexcoord);
	if (u_silo > 0.5) {
		base.rgb = u_outline;}
	else if (distance(base.rgb, vec3(1.0,0.0,1.0)) < 0.02) {
	base.rgb = u_outline;}
	else if (base.g == 0.0 && base.b == 0.0) {base.rgb = base.r * u_skin;}
	else if (base.g == 0.0 && base.r == 0.0) {base.rgb = base.b * u_cloth;}
	else {base.rgb *= u_tint;}
    gl_FragColor = v_vColour * base;
}
