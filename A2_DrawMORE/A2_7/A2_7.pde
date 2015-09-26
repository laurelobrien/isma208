/*
A2_7
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Using variables for x and y position, move four shapes 
across the canvas in different directions. Ensure the position
of the shapes wrap around the canvas dimensions.
*/

//initialize variables to calculate x and y coordinates
float xPos = 0;
float yPos = 0;

void draw() 
{
  background(128); //'erase' drawings from previous run-throughs of draw()
  
  noStroke();
  rectMode(CENTER); //draw rectangles from the center
  
  triangle(50, 30, 20, 70, 80, 70);
  ellipse(50, 50, 20, 20);
  rect(50, 50, 60, 20);
  
  xPos ++; //increment xPos by 1
  yPos++; //increment yPos by 1
}
