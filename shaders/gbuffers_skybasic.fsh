#version 120

uniform int worldTime;

varying vec4 starData;

void main() {
	vec3 color;
	if (starData.a > 0.5f) {
		color = vec3(0.75f, 0.75f, 0.75f);
	} else if(worldTime < 12000) {
		color = vec3(0.5f, 0.5f, 0.5f);
	} else if(worldTime > 12000) {
		color = vec3(0.25f, 0.25f, 0.25f);
	}

/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(color, 1.0);
}
