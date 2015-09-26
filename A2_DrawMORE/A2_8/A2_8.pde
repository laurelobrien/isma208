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
int floralDisc = 0; //center ellipse's size
int discPetal = 0; //intermediate triangles' size
int rayPetal = 0; //outer rectangles' size

//initialize variable for counting cycles of draw()
int dayCount = 0;

//draw an abstract daisy whose parts grow at different rates,
//though never closer than 10px to any edge of the canvas
void draw() 
{
  noStroke();
  rectMode(CENTER); //draw rectangles from the center
  background(#ADEAE3); //light blue: wipe canvas at start of function
  
  fill(#F6F6F6); //almost-white
  rect(50, 50, rayPetal % 80, rayPetal % 80); //outer rectangle
  
  fill(#FAEEB1); //sunshine yellow
  ellipse(50, 50, discPetal % 80, discPetal % 80); //intermediate triangles
  
  fill(#F7DD57); //golden yellow
  ellipse(50, 50, floralDisc % 80, floralDisc % 80); //inner ellipse
  
  dayCount++; //1 day passes
  rayPetal++; //outer petals grow
  
  //only increment some parts of the flower on certain days
  if (dayCount % 2 == 0) //check if an even number of days have passed
  {
    discPetal ++; //inner petals grow
  }
  if (dayCount % 4 == 0) //check if 4 days have passed
  {
    floralDisc ++; //center of flower grows
  }
}
