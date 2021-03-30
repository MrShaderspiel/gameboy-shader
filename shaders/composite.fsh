#version 120

uniform sampler2D gcolor;

varying vec2 texcoord;

#define NATIVE_RES   // Native GB resolution

vec3 darkestGreen = vec3(15.0f, 56.0f, 15.0f) / 255.0f;
vec3 darkGreen = vec3(48.0f, 98.0f, 48.0f) / 255.0f;
vec3 lightGreen = vec3(139.0f, 172.0f, 15.0f) / 255.0f;
vec3 lightestGreen = vec3(155.0f, 188.0f, 15.0f) / 255.0f;

vec2 GBres = vec2(1.0f/160.0f, 1.0f/144.0f);

void main() {
	#ifdef NATIVE_RES
		vec4 color = texture2D(gcolor, floor(texcoord/GBres)*GBres);
	#endif
	#ifndef NATIVE_RES
		vec4 color = texture2D(gcolor, texcoord);
	#endif

	float avgColor = (color.r + color.g + color.b) * 0.333f;
	
	if(avgColor<=0.25f) {
		color = vec4(darkestGreen, color.a);
	} else if(avgColor<=0.5f) {
		color = vec4(darkGreen, color.a);
	} else if(avgColor<=0.75f) {
		color = vec4(lightGreen, color.a);
	} else {
		color = vec4(lightestGreen, color.a);
	}

/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
