//  Modified Confetti Cannon
//  derived from Orange Book
#version 120

uniform   float time;  //  Time
attribute float Start; //  Start time
attribute vec3  Vel;   //  Velocity

void main(void)
{
   //  Particle location
   vec4 vert = gl_Vertex;
   //  Time offset mod 30
   float t = mod(time,30.0)-Start;

   //  Pre-launch color black
   if (t<0.0)
      gl_FrontColor = vec4(0,0,0,1);
   else
   {
      //  Particle color
      gl_FrontColor =  vec4(1,1,1,1);
      //  Particle trajectory
      vert   += t*vec4(Vel,0);
      //  Gravity
      vert.y -= 1.7*t*t;
   }
   //  Transform particle location
   gl_Position = gl_ModelViewProjectionMatrix*vert;
}
