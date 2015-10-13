/*
A3_10
Laurel O'Brien
laureljobrien@gmail.com
10/11/15
Create a motion graphic using cos and/or sin.
*/

//declare and initialize
float xAxis;
float trackLength;
float angle = 0; //modify sin and cos arguments

void setup()
{
  trackLength = width - 40; //40px buffer

  noFill(); //remove fill
}


void draw() 
{
  background(#12deef); //cyan: erase last frame
  
  float xAxis = 20 + (sin(angle + PI/2) * trackLength/2) + trackLength/2; //left and right drifting
  
  noStroke(); //remove stroke from white ring
  fill(0, 0, 0, 50); //low opacity black
  ellipse(xAxis-4, height/1.5+11, 27, 7); //ellipse drawn under and to the left of white ring
  
  noFill(); //remove fill from black ellipse
  stroke(255); //white
  strokeWeight(2); //thicker stroke
  ellipse(xAxis, height/1.5, 20, 20); //white ring
  
  angle += 0.02; //increment sin()/cos() angle
}
