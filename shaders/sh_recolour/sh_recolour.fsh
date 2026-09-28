//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_outline;
uniform vec3 u_tint;

void main()
{
	vec4 base = texture2D(gm_BaseTexture, v_vTexcoord);
	if (distance(base.rgb, vec3(1.0,0.0,1.0)) < 0.02) {
	base.rgb = u_outline;} else {base.rgb *= u_tint;}
    gl_FragColor = v_vColour * base;
}
