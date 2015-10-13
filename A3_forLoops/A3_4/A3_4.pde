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

int diameter = 30; //ellipse diameter
int radius = diameter/2; //ellipse radius

void setup() 
{
  noStroke(); //persistent lack of stroke
  frameRate(18); //slowed framerate
}

//call 2 functions to draw 2 ellipses moving in straight lines
//within the confines of the canvas at different speeds. they will
//change direction if they touch the edge of the canvas, and follow
//different paths from each other due to their different x and y movement speeds.
void draw() {
  background(#AEEDF0);
  slowEllipse(); //x and y rates of movement are equal and consistent
  fastEllipse(); //x and y rates of movement movement are different 
}

//draw an ellipse moving diagonally between top-left and bottom-right corners.
void slowEllipse() 
{
  elliX += 1 * xDirectionModifier; //move x position 1px
  elliY += 1 * yDirectionModifier; //move y position 1px
  
  //test if ellipse has touched LEFT or RIGHT edge
  //and if so, change its direction modifier to reverse
  //movement along x axis
  if (elliX == height - radius) {
    xDirectionModifier = (-1); //make increments (decrements?) negative
  } else if (elliX == radius) {
    xDirectionModifier = 1; //make increments positive
  }
  
  //test if ellipse has touched TOP or BOTTOM edge
  //and if so, similarly reverse its direction
  if (elliY == height - radius) {
    yDirectionModifier = (-1); //make increments negative
  } else if (elliY == radius) {
    yDirectionModifier = 1; //make increments positive
  }
  
  fill(#FFFFFF); //white
  ellipse(elliX, elliY, diameter, diameter); //draw ellipse
}

void fastEllipse() 
{
  elliX2 += 3 * xDirectionMod; //move x position 3px
  elliY2 += 5 * yDirectionMod; //move y position 5px
  
  //test if ellipse has touched LEFT or RIGHT edge
  //and if so, change its direction modifier to reverse
  //movement along x axis
  if (elliX2 >= width - radius) {
    xDirectionMod = (-1); //make increments (decrements?) negative
  } else if (elliX2 <= radius) {
    xDirectionMod = 1; //make increments positive
  }
  
  //test if ellipse has touched TOP or BOTTOM edge
  //and if so, similarly reverse its direction
  if (elliY2 >= height - radius) {
    yDirectionMod = (-1); //make increments negative
  } else if (elliY2 <= radius) {
    yDirectionMod = 1; //make increments positive
  }
  
  fill(255, 200, 0); //orange
  ellipse(elliX2, elliY2, diameter, diameter); //draw ellipse
}
