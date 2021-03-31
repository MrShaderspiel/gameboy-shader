float roundToNearest(float number, float nearest) {
	return floor(number / nearest) * nearest;
}

float avgVec3(vec3 vector) {
	return (vector.x + vector.y + vector.z) * 0.33333; 
}

vec4 colorCorrection(vec4 color) {
	vec3 newColor = color.rgb;
	float brightness = avgVec3(newColor);
	if(avgColor <= 0.25f) {
		newColor = darkestGreen;
	} else if(avgColor <= 0.5f) {
		newColor = darkGreen;
	} else if(avgColor <= 0.75f) {
		newColor = lightGreen;
	} else {
		newColor = lightestGreen;
	}
	return vec4(newColor, color.a);
}

vec2 resolutionCorrection(vec2 coords) {
	return vec2(floor(coords/(1.0f/GBRes))*(1.0f/GBRes));
}
