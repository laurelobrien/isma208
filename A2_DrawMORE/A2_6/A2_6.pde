/*
A2_6
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program that draws two vertical lines moving horizontally 
across the canvas.
*/

//initialize variable for calculating x coordinate(s)
float xPos = 0;

//draw two 60px tall lines 10px away from each other that move
//from left to right and wrap back around when they exit
//the right edge of the canvas
void draw() 
{
  background(128); //medium grey
  
  line(xPos % 100, 20, xPos % 100, 80); //x axis of both points dictated by xPos
  line((xPos + 10) % 100, 20, (xPos + 10) % 100, 80); //10px farther down x axis than first line
  
  xPos ++; //increment xPos by 1
}
