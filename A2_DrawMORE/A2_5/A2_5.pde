/*
A2_5
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program that draws one shape increasing in size at a rate
dependent on the mouse position. Make sure the size of the shape 
wraps at some arbitrary value.
*/

//draw a green ellipse that increases in size with mouse's distance
//from left edge of canvas, but starts over at 1x1 if it would
//pass the 50x50 black barrier
void draw() 
{
  background(255); //'erase' drawing from last run-through of draw()
  
  stroke(0); //black
  strokeWeight(2); //more visible stroke
  noFill(); //empty black container
  ellipse(50, 50, 50, 50);
  
  noStroke(); //erase container's stroke settings
  fill(0, 255, 0); //green
  ellipse(50, 50, mouseX % 50, mouseX % 50); //mouse x position increases diameter but never larger than 50x50
}
