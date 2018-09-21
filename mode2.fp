// mode 2 - ambient and Lambertian lighting

varying vec3 N;  // surface normal in camera 
varying vec3 v;  // surface fragment location in camera 
 
void main(void) {

	// Objective 2: compute ambient and Lambertial lighting

    //gl_FragColor = vec4( N.xyz*0.5+vec3(0.5,0.5,0.5), 1 );
    // diffuse: https://www.opengl.org/sdk/docs/tutorials/ClockworkCoders/lighting.php
   vec3 L = normalize(gl_LightSource[0].position.xyz - v);
   vec4 Idiff = gl_FrontLightProduct[0].diffuse * max(dot(N,L), 0.0);
   Idiff += gl_LightSource[0].ambient; // + ambient
   Idiff = clamp(Idiff, 0.0, 1.0);
   gl_FragColor = Idiff;
}
