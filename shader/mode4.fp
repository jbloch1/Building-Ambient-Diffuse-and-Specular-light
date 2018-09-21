// mode 4 - ambient and Lambertian and Specular with shadow map

uniform sampler2D shadowMap; 
uniform float sigma;

varying vec3 N;  // surface normal in camera 
varying vec3 v;  // surface fragment location in camera 
varying vec4 vL; // surface fragment location in light view NDC

void main(void) {

	// TODO: Objective 6: ambient, Labertian, and Specular with shadow map.
	// Note that the shadow map lookup should only modulate the Lambertian and Specular component.

    // https://www.opengl.org/sdk/docs/tutorials/ClockworkCoders/lighting.php
      
   vec3 L = normalize(gl_LightSource[0].position.xyz - v);   
   vec3 E = normalize(-v); // we are in Eye Coordinates, so EyePos is (0,0,0)  
   vec3 R = normalize(-reflect(L,N));  
 
   //calculate Ambient Term:
   vec4 Iamb = gl_FrontLightProduct[0].ambient;    

   //calculate Diffuse Term:  
   vec4 Idiff = gl_FrontLightProduct[0].diffuse * max(dot(N,L), 0.0);
   Idiff = clamp(Idiff, 0.0, 1.0);
   
   // calculate Specular Term:
   vec4 Ispec = gl_FrontLightProduct[0].specular 
                * pow(max(dot(R,E),0.0),0.3*gl_FrontMaterial.shininess);
   Ispec = clamp(Ispec, 0.0, 1.0); 

   // write Total Color:
   gl_FragColor = Iamb + (Ispec + Idiff) * texture2D(shadowMap, vL.xy);
   //gl_FragColor = texture2D(shadowMap, vL.xy); // no?
   //gl_FragColor = texture2D(shadowMap, gl_TexCoord[0].st);
}
