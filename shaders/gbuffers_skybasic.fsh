#version 120

uniform float viewHeight;
uniform float viewWidth;
uniform mat4 gbufferModelView;
uniform mat4 gbufferProjectionInverse;
uniform vec3 fogColor;
uniform vec3 skyColor;

varying vec4 starData;

void main() {
	vec3 color;
	if (starData.a > 0.5) {
		color = vec3(15.0f, 56.0f, 15.0f);
		color /= 255.0f;
	}
	else {
		color = vec3(155.0f, 188.0f, 15.0f);
		color /= 255.0f;
	}

/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(color, 1.0);
}
