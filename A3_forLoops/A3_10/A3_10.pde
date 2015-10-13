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
int greyTone = 0; //greyness in RGB colourspace
int greyMod = 1; //whether greyness darkens or lightens

void setup()
{
  background(#12deef); //cyan: erase last frame
  trackLength = width - 30; //30px buffer
  noStroke();
}


void draw() 
{
  float xAxis = 15 + (sin(angle + PI/2) * trackLength/2) + trackLength/2;
  
  fill(0 + greyTone * greyMod);
  ellipse(xAxis, height/2, 20, 20);
  
  if (greyTone == 255) {
    greyMod = (-1); //make increments negative
  } else if (greyTone == 0) {
    greyMod = 1; //make increments positive
  }
  
  angle += 0.03; //increment sin()/cos() angle
  greyTone += 1 * greyMod; //increment greyTone by 2
  
  println(greyTone);
}
