/*
A3_4
Laurel O'Brien
laureljobrien@gmail.com
10/04/15
Create an animation of a shape that moves across the screen 
and changes direction when it reaches the canvas bounds.
*/

//initialize variables
int elliX = 50; //x position of ellipse()
int elliY = 50; //y position of ellipse()
int xDirectionModifier = 1; //indicate positive or negative movement
int yDirectionModifier = 1;

void setup() 
{
  background(#AEF0EF); //light blue
  noStroke(); //persistent lack of stroke
  frameRate(18); //slowed to see effect of iteration
}

void draw() 
{
  background(#AEF0EF);
  
  elliX += 1 * xDirectionModifier; //move x position 1px
  elliY += 1 * yDirectionModifier; //move y position 1px
  
  if (elliX == 85) {
    xDirectionModifier = (-1);
  } else if (elliX == 15) {
    xDirectionModifier = 1;
  }
  
  fill(#FFFFFF); //white
  ellipse(elliX, 50, 30, 30);
}
