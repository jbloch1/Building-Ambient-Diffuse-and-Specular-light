// mode 1 - ambient lighting

void main(void) 
{
   gl_FragColor = vec4(gl_LightSource[0].ambient); // Objective 1: set the ambient light colour
}