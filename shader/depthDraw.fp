// Draws the depth from the texture map in different shades of grey
// and with transparency controlled by a uniform.

uniform float alpha; 

uniform sampler2D depthTexture; 

void main(void) {
	vec4 shadowcolor = texture2D( depthTexture, gl_TexCoord[0].xy );
    gl_FragColor = vec4(vec3(gl_FragCoord.z), 1);
}
