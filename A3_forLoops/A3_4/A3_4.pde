/*
A3_4
Laurel O'Brien
laureljobrien@gmail.com
10/04/15
Create an animation of a shape that moves across the screen 
and changes direction when it reaches the canvas bounds.
*/

//initialize variables
int elliX = 15; //x position of ellipse()
int elliY = 15; //y position of ellipse()
boolean movingRightDown = false;

void setup() 
{
  background(#AEF0EF); //light blue
  noStroke(); //persistent lack of stroke
  frameRate(18); //slowed to see effect of iteration
}

void draw() 
{
  background(#AEF0EF);
  fill(#FFFFFF); //white
  ellipse(elliX, elliY, 30, 30);
  
  if ((elliX < 85) && (elliY < 85)) {
    elliX ++;
    elliY ++;
    movingRightDown = true;
  }
}
