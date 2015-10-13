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
  trackLength = width - 40; //40px buffer from center of white ring
  noStroke();
}


void draw() 
{
  drawBackground();
  
  float xAxis = 20 + (sin(angle + PI/2) * trackLength/2) + trackLength/2; //left and right drifting
  
  ellipseMode(CORNER);
  fill(0, 0, 0, 50); //low opacity black
  ellipse(xAxis-10+(xAxis*0.05), height/1.5+7, 15+(xAxis*0.3), 32-(xAxis*0.3)); //ellipse drawn under and to the left of white ring
  
  ellipseMode(CENTER);
  fill(255);
  ellipse(xAxis, height/1.5, 20, 20); //white ring
  
  angle += 0.02; //increment sin()/cos() angle
}


//draw a sun setting over the desert
void drawBackground() 
{
  background(#ffe27b); //yellow
  
  fill(#ffbd57); //pale orange
  rect(0, 0, width, height-height/2.5);
  
  fill(#ff8768); //peach
  rect(0, 0, width, height-height/1.9);
  
  fill(#ff6053); //cinnamon
  rect(0, 0, width, height-height/1.5);
  
  fill(#863f48); //purple
  rect(0, 0, width, height-height/1.3);
  
  fill(#E85621); //blood orange
  ellipse(30, height-height/3, 30, 30);
  
  fill(#F0D096); //sandy yellow
  rect(0, height-height/3, width, height/3);
}
