#version 120

uniform sampler2D texture;
uniform int worldTime;

varying vec2 texcoord;
varying vec4 glcolor;

void main() {
	vec4 color = texture2D(texture, texcoord) * glcolor;
	
	if(color.a > 0.1f && worldTime < 12000) {
		color = vec4(0.0f, 0.0f, 0.0f, 1.0f);
	} else if(color.a > 0.1f && worldTime >= 12000) {
		color = vec4(0.5f, 0.5f, 0.5f, 1.0f);
	} else {
		color = vec4(0.0f, 0.0f, 0.0f, 0.0f);
	}

	
/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
