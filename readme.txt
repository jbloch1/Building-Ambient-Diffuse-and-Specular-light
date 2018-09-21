For question 1, the ambient was set in mode1.fp.

For question 2, there is the ambient light and then the diffuse in mode2.fp.

For question 3, ambient, diffuse and specular lighting was implemented in mode3.fp.

For question 4, Light frame is being drawn by using GLU.gluLookAt to create the viewing matrix and then 
the appropriate transformations is used for drawing the light's camera frame

For question 5, The light projection transformation is being set up and then the appropriate matrices to draw the light frustum's NDC is set up to allow the frustum to be drawn with a wire cube, and a textured quad to be drawn on the near plane (provided the light rendering pass and matrices are correctly set up

For question 6, the second parameter for sigma is 0.01 but no shadows have been seen so it couldn't be set. 
Ambient lighting was added to file shader/mode4.fp
But when the matrix that transforms from camera frame to the light's NDC was built, shadows was still not shown at all.
glTexSubImage2D was used to hard code it, but still shadows was not seen. It is suspected that LPM and tbc were used incorrectly, but without documentation it was not clear how.


