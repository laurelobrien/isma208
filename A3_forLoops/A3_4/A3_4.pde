/*
A3_4
Laurel O'Brien
laureljobrien@gmail.com
10/04/15
Create an animation of a shape that moves across the screen 
and changes direction when it reaches the canvas bounds.
*/

//initialize variables
int elliX = 50; //x position of ellipse() in slowEllipse()
int elliY = 50; //y position of ellipse() in slowEllipse()
int xDirectionModifier = 1; //indicate positive or negative movement in slowEllipse()
int yDirectionModifier = 1;

int elliX2 = 50; //x position of ellipse() in fastEllipse()
int elliY2 = 50; //y position of ellipse() in fastEllipse()
int xDirectionMod = 1; //indicate positive or negative movement in fastEllipse()
int yDirectionMod = 1;

void setup() 
{
  background(#AEF0EF); //light blue
  noStroke(); //persistent lack of stroke
  frameRate(18); //slowed to see effect of iteration
}

//call 2 functions to draw 2 ellipses moving in straight lines
//within the confines of the canvas at different speeds 
void draw() {
  background(#AEEDF0);
  slowEllipse(); //x and y rates of movement are equal and consistent
  fastEllipse(); //x and y rates of movement movement are different 
}

void slowEllipse() 
{
  elliX += 1 * xDirectionModifier; //move x position 1px
  elliY += 1 * yDirectionModifier; //move y position 1px
  
  //test if ellipse has touched left or right edge
  //and if so, change its direction modifier to reverse
  //movement along x axis
  if (elliX == height - 15) {
    xDirectionModifier = (-1); //make increments (decrements?) negative
  } else if (elliX == 15) {
    xDirectionModifier = 1; //make increments positive
  }
  
  //test if ellipse has touched top or bottom edge
  //and if so, similarly reverse its direction
  if (elliY == height - 15) {
    yDirectionModifier = (-1); //make increments negative
  } else if (elliY == 15) {
    yDirectionModifier = 1; //make increments positive
  }
  
  fill(#FFFFFF); //white
  ellipse(elliX, elliY, 30, 30); //draw ellipse (radius of 15 for calculating edges)
}

void fastEllipse() 
{
  elliX2 += 3 * xDirectionMod; //move x position 3px
  elliY2 += 5 * yDirectionMod; //move y position 5px
  
  //test if ellipse has touched left or right edge
  //and if so, change its direction modifier to reverse
  //movement along x axis
  if (elliX2 >= width - 15) {
    xDirectionMod = (-1); //make increments (decrements?) negative
  } else if (elliX2 <= 15) {
    xDirectionMod = 1; //make increments positive
  }
  
  //test if ellipse has touched top or bottom edge
  //and if so, similarly reverse its direction
  if (elliY2 >= height - 15) {
    yDirectionMod = (-1); //make increments negative
  } else if (elliY2 <= 15) {
    yDirectionMod = 1; //make increments positive
  }
  
  fill(128, 80, 0); //orange
  ellipse(elliX2, elliY2, 30, 30); //draw ellipse, radius of 15 for calculating edges
}
