/*
A2_9
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a shape that changes colour and size such that the rate 
of change is determined by the mouseX and mouseY position, 
respectively. Ensure the colour and size wrap around different 
arbitrary values.
*/

//initialize variables to change colour value and shape coordinates
int yellow = 0;
int leftCornerX = 0;
int leftCornerY = 0;
int rightCornerX = 0;
int rightCornerY = 0;

void draw() 
{
  background(128); //medium grey
  noStroke();
  
  fill(242, 211, 164); //peach
  quad(90, 10, (55 + rightCornerX), (20 + rightCornerY), (45 - leftCornerX), (20 + leftCornerY), 10, 10);
  
  leftCornerX ++; //increments by 1 to move left
  leftCornerY ++; //increments by 1 to move down
  rightCornerX ++; //increments by 1 to move right
  rightCornerY ++; //increments by 1 to move down
}
