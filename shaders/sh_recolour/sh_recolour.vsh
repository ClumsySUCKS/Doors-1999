//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 v_vTexcoord;
uniform vec3 u_tint;

void main()
{
	vec4 base = texture2D(gm_BaseTexture, v_vTexcord);
	if (distance(base.rgb, vec3(1.0,0.0,1.0)) < 0.02) {
		base.rgb = u_outline;}
		else {base.rgb *= u_tint;}
		gl_FragColor = v_vColour * base;
}
