#version 120

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

vec3 darkestGreen = vec3(15.0f, 56.0f, 15.0f) / 255.0f;
vec3 darkGreen = vec3(48.0f, 98.0f, 48.0f) / 255.0f;
vec3 lightGreen = vec3(139.0f, 172.0f, 15.0f) / 255.0f;
vec3 lightestGreen = vec3(155.0f, 188.0f, 15.0f) / 255.0f;

void main() {
	vec4 color = texture2D(texture, texcoord) * glcolor;
	color *= texture2D(lightmap, lmcoord);
	
	float avgColor = (color.r + color.g + color.b) * 0.333f;
	
	if(avgColor<=0.25f) {
		color = vec4(darkestGreen, 1.0f);
	} else if(avgColor<=0.5f && avgColor>=0.25f) {
		color = vec4(darkGreen, 1.0f);
	} else if(avgColor<=0.75f && avgColor>=0.5f) {
		color = vec4(lightGreen, 1.0f);
	} else {
		color = vec4(lightestGreen, 1.0f);
	}
	
/* DRAWBUFFERS:0 */
	gl_FragData[0] = color; //gcolor
}
