//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float in_threshold[5];
uniform float in_red[5];
uniform float in_green[5];
uniform float in_blue[5];

void main()
{
	vec4 pixelColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (pixelColor.r > 0.0) {
		if (pixelColor.r <= in_threshold[0]) {
			pixelColor.r = in_red[0];	
			pixelColor.g = in_green[0];	
			pixelColor.b = in_blue[0];	
		} else if (pixelColor.r <= in_threshold[1]) {
			pixelColor.r = in_red[1];	
			pixelColor.g = in_green[1];	
			pixelColor.b = in_blue[1];	
		} else if (pixelColor.r <= in_threshold[2]) {
			pixelColor.r = in_red[2];	
			pixelColor.g = in_green[2];	
			pixelColor.b = in_blue[2];	
		} else if (pixelColor.r <= in_threshold[3]) {
			pixelColor.r = in_red[3];	
			pixelColor.g = in_green[3];	
			pixelColor.b = in_blue[3];	
		}
		else if (pixelColor.r <= in_threshold[4]) {
			pixelColor.r = in_red[4];	
			pixelColor.g = in_green[4];	
			pixelColor.b = in_blue[4];	
		}
	}
	
    gl_FragColor = pixelColor;
}