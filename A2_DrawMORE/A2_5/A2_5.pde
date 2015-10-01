/*
**NOT FINISHED: ellipse growth speed currently does not respond to mouseX **
A2_5
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program that draws one shape increasing in size at a rate
dependent on the mouse position. Make sure the size of the shape 
wraps at some arbitrary value.
*/

//initialize global variables for increasing size of ellipse in draw()
float diameter = 0; 
float diameterIncrease = mouseX * 0.2;

//draw a green ellipse that constantly increases in size
//at a speed increasing as the mouse moves from left to right.
//it resets to a diameter of 0 before it passes 50x50 black container.
void draw() 
{
  background(255); //'erase' last run of draw() 
  
  stroke(0); //black
  strokeWeight(2); //more visible stroke
  noFill(); //empty black container
  ellipse(50, 50, 50, 50);
  
  noStroke(); //erase above container's stroke settings
  fill(0, 255, 0); //green
  ellipse(50, 50, (diameter + diameterIncrease) % 50, (diameter + diameterIncrease) % 50); //mouse x position increases diameter but resets at 50
  
  diameter ++; //increase by a minimum of 1
  
  
}
