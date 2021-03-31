#version 120

uniform sampler2D gcolor;
uniform float viewWidth;
uniform float viewHeight;

varying vec2 texcoord;

#define NATIVE_RES   // Native GB resolution
// #define NATIVE_ASPECT_RATIO   // Native GB aspect ratio
// #define PIXEL_GAPS   // GB pixel gaps

vec3 darkestGreen = vec3(15.0f, 56.0f, 15.0f) / 255.0f;
vec3 darkGreen = vec3(48.0f, 98.0f, 48.0f) / 255.0f;
vec3 lightGreen = vec3(139.0f, 172.0f, 15.0f) / 255.0f;
vec3 lightestGreen = vec3(155.0f, 188.0f, 15.0f) / 255.0f;

vec2 resolution = vec2(viewWidth, viewHeight);
vec2 GBRes = vec2(160.0f, 144.0f);
float pixelSize = resolution.y/GBRes.y;

#include "/lib/utils.glsl"

void main() {
	vec2 newCoords = texcoord;
	
	#ifdef NATIVE_RES
		newCoords = resolutionCorrection(newCoords);
	#endif
	#ifdef NATIVE_ASPECT_RATIO
		newCoords = aspectRatioCorrection(newCoords);
	#endif
	
	vec4 color = texture2D(gcolor, newCoords);
	color = colorCorrection(color);
	
	#ifdef PIXEL_GAPS
		if((newCoords.x * resolution.x) % pixelSize == 0.0f) {
			color = vec4(lightGreen, color.a);
		} else if((newCoords.x * resolution.x) % pixelSize == 1.0f) {
			color = vec4(lightGreen, color.a);
		} else if((newCoords.y * resolution.y) % pixelSize == 0.0f) {
			color = vec4(lightGreen, color.a);
		} else if((newCoords.y * resolution.y) % pixelSize == 1.0f) {
			color = vec4(lightGreen, color.a);
		}
	#endif

/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
