version 120

uniform sampler2D gcolor;

varying vec2 texcoord;

vec3 darkestGreen = vec3(15.0f, 56.0f, 15.0f) / 255.0f;
vec3 darkGreen = vec3(48.0f, 98.0f, 48.0f) / 255.0f;
vec3 lightGreen = vec3(139.0f, 172.0f, 15.0f) / 255.0f;
vec3 lightestGreen = vec3(155.0f, 188.0f, 15.0f) / 255.0f;

void main() {
	vec3 color = texture2D(gcolor, texcoord).rgb;
	vec3 avgColor = vec3((color.r + color.g + color.b) * 0.333f);
	
	if(avgColor<=0.25f) {
		color = vec3(darkestGreen);
	} else if(avgColor<=0.5f && avgColor>=0.25f) {
		color = vec3(darkGreen);
	} else if(avgColor<=0.75f && avgColor>=0.5f) {
		color = vec3(lightGreen);
	} else {
		color = vec3(lightestGreen);
	}
	
/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(color, 1.0); //gcolor
}
