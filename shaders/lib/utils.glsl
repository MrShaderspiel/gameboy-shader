vec3 pixelGrid(vec3 color, vec2 coord) {
    float gridLeft = 1.0f/(pixelSize-(PIXEL_GAP/2.0f));
    float gridRight = 1.0f/(pixelSize+(PIXEL_GAP/2.0f));
    if(coord.x >= gridLeft && coord.x <= gridRight) {
        return lightGreen;
    } else if(coord.y >= gridLeft && coord.y <= gridRight) {
        return lightGreen;
    } else {
        return color;
    }
}


float roundToNearest(float number, float nearest) {
    return floor(number/nearest)*nearest;
}

vec2 roundToNearest(vec2 number, float nearest) {
    return floor(number/nearest)*nearest;
}

vec3 roundToNearest(vec3 number, float nearest) {
    return floor(number/nearest)*nearest;
}

vec4 roundToNearest(vec4 number, float nearest) {
    return floor(number/nearest)*nearest;
}
