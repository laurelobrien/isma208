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

//initialize variables for storing size and colour values
int rectLength = 0; //manipulate height argument of rect();
int green = 0; //manipulate green and blue values of an rgb colour
int blue = 0;

void draw() 
{
  noStroke();
  background(242, 211, 164); //medium grey: wipe last drawing from running draw()
  
  fill(255, (128 + green) % 255), (128 + blue) % 255); //peach minus green and blue variables
  rect(30, 0, 40, 40 + rectLength); //square grows to tall rectangle
  
  green += (mouseY * 0.1);
  blue += (mouseY * 0.1);
}
