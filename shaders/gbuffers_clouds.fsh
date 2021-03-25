#version 120

uniform sampler2D texture;

varying vec2 texcoord;
varying vec4 glcolor;

void main() {
	vec4 color = texture2D(texture, texcoord) * glcolor;
	
	if(color.r==1.0f) {
		color = vec4(vec3(15.0f, 56.0f, 15.0f)/255.0f, 1.0f);
	}
	
/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
