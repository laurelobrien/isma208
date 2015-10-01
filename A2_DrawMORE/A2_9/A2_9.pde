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

//draw rectangle that starts square and grows longer, faster as you move your mouse down, and
//transitions from red to white, faster as you move your mouse right. 
//colour and height will reset if they reach white or 90px respectively. 
void draw() 
{
  noStroke(); //remove stroke
  background(242, 211, 164); //peach: wipe last drawing from running draw()
  
  fill(255, ((128 + green) % 255), ((128 + blue) % 255)); //grey-ish red plus green and blue variables
  rect(30, 0, 40, (40 + rectLength) % 90); //square that grows to tall rectangle
  
  //increment variables by 10% of relevant mouse position, +1 to ensure a value > 1 is always added
  //in the case that 10% of mouseX/mouseY is < 1 and no change would occur visually
  green += (mouseX * 0.1) + 1; 
  blue += (mouseX * 0.1) + 1;
  rectLength += (mouseY * 0.1) +1;
}
