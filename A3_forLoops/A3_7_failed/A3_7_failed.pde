/*
A3_7
Laurel O'Brien
laureljobrien@gmail.com
10/11/15
Create an animation of a circle that moves around
the circumference of a larger circle.
*/

float diameter = 15;
float a = 0;
float x = sin(a) * diameter/2;
float y = cos(a) * diameter/2;

void setup() 
{
  noStroke(); //remove stroke
}


void draw() 
{
  background(0); //black: erase last frame
  
  fill(#65D7F5); //blue
  ellipse(50, 50, 30, 30); //larger circle
  
  fill(#d6d6d6); //light grey
  ellipse(50 + x, 50 + y, diameter, diameter);
  
  a += 0.01;
  
  println(a);
}
