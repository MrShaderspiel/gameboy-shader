#version 120

uniform sampler2D gcolor;
uniform sampler2D colortex4;
uniform sampler2D colortex5;

uniform float viewWidth;
uniform float viewHeight;

varying vec2 texcoord;

#define NATIVE_RES   // Native GB resolution

// 0 = none, 1 = bars, 2 = fullscreen gameboy, 3 = normal gameboy
#define OVERLAY_METHOD 2   // Enable and change overlays [0, 1, 2, 3]

vec3 darkestGreen = vec3(15.0f, 56.0f, 15.0f) / 255.0f;
vec3 darkGreen = vec3(48.0f, 98.0f, 48.0f) / 255.0f;
vec3 lightGreen = vec3(139.0f, 172.0f, 15.0f) / 255.0f;
vec3 lightestGreen = vec3(155.0f, 188.0f, 15.0f) / 255.0f;

vec2 resolution = vec2(viewWidth, viewHeight);
vec2 GBRes = vec2(160.0f, 144.0f);
float pixelSize = resolution.y / GBRes.y;

float barWidth = 1.0f / (mod(20.0f, resolution.x) * 0.5f);

float roundToNearest(float number, float nearest) {
	return floor(number / nearest) * nearest;
}

float avgVec3(vec3 vector) {
	return (vector.x + vector.y + vector.z) * 0.33333; 
}

void main() {
	vec2 newCoords = texcoord;
	
	#ifdef NATIVE_RES
		newCoords = vec2(floor(newCoords.x / ((pixelSize / resolution.x))) * ((pixelSize / resolution.x)), floor(newCoords.y / (1.0f / GBRes.y)) * (1.0f / GBRes.y));
	#endif

	vec4 color = texture2D(gcolor, newCoords);
	float brightness = avgVec3(color.rgb);

	if(brightness <= 0.25f) {
		color.rgb = darkestGreen;
	} else if(brightness <= 0.5f) {
		color.rgb = darkGreen;
	} else if(brightness <= 0.75f) {
		color.rgb = lightGreen;
	} else {
		color.rgb = lightestGreen;
	}
	
	// black bars
	#if OVERLAY_METHOD == 1
		if(newCoords.x < barWidth) {
			color = vec4(0.0f, 0.0f, 0.0f, 1.0f);
		} else if(newCoords.x > 1.0f - barWidth) {
			color = vec4(0.0f, 0.0f, 0.0f, 1.0f);
		}
		
	// fullscreen gameboy
	#elif OVERLAY_METHOD == 2
		vec4 overlay = texture2D(colortex4, texcoord.xy * vec2(1.0f, -1.0f));
		if(overlay.a > 0.1f) {
			color = vec4(vec3(overlay.rgb), 1.0f);
		}
		
	// normal gameboy
	#elif OVERLAY_METHOD == 3
		vec4 overlay = texture2D(colortex5, texcoord.xy * vec2(1.0f, -1.0f));
		if(overlay.a > 0.1f) {
			color = vec4(vec3(overlay.rgb), 1.0f);
		}
	#endif

/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
