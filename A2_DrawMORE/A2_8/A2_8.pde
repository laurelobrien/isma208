/*
A2_8
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program with at least three different shapes 
that increase or decrease in size at different speeds. 
Ensure the size values wrap to some common maximum value.
*/

//initialize variables for storing shape size
int stamenX = 0; //center line's x-axis terminal
int stamenY = 0; //center line's y-axis terminal
int floralDisc = 0; //center ellipse's size
int rayPetal = 0; //outer rectangles' size

//initialize variable for counting cycles of draw()
int dayCount = 0;

//draw an abstract daisy whose parts grow at different rates,
//though never reaching 80px
void draw() 
{
  noStroke();
  rectMode(CENTER); //draw rectangles from the center
  background(#ADEAE3); //light blue: wipe canvas at start of function
  
  fill(#F6F6F6); //almost-white
  rect(50, 50, rayPetal % 80, rayPetal % 80); //outer rectangle
  
  fill(#F7DD57); //yellow
  ellipse(50, 50, floralDisc % 80, floralDisc % 80); //inner ellipse
  
  //stamen intentionally wraps at 40 instead of 80 to be visually consistent with other shapes
  //since they're drawn from the center
  stroke(#F0B00F); //orange
  line(50, 50, 50 + stamenX % 40, 50 + stamenY % 40); // stamenX and stamenY wrap at 40px, added to 50 to start from center
  
  dayCount++; //1 day passes
  rayPetal++; //outer petals grow
  
  //only increment some parts of the flower on certain days
  if (dayCount % 4 == 0) //check if 4 days have passed
  {
    stamenX ++; //stamen grows outwards
    stamenY ++; //stamen grows downwards
  }
  if (dayCount % 6 == 0) //check if 6 days have passed
  {
    floralDisc ++; //center of flower grows
  }
}
