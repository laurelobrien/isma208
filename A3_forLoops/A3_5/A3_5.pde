/*
A3_5
Laurel O'Brien
laureljobrien@gmail.com
10/04/15
Create an animation of a shape that moves across the screen 
and changes direction and colour when it reaches the canvas bounds. 
Ensure the shape position is reset when the mouse button is pressed.
*/

//initialize variables
int rectX = 50; //x position of rect()
int rectY = 50; //y position of rect()
int xDirectionModifier = 1; //indicate positive or negative movement
int yDirectionModifier = 1;
//variables for making random (roughly bluish-green) fill
float red;
float green;
float blue;

void setup() 
{
  noStroke(); //persistent lack of stroke
  rectMode(CENTER); //draw rectangles from the center
  frameRate(18); //slowed framerate
}

//draw a square bouncing around the canvas in straight lines
//that changes colour when it bounces off the edge of the canvas.
//it resets to its starting position at the center of the canvas
//when the mouse button is pressed.
void draw() 
{
  background(255); //white: erase last frame
  
  rectX += 1 * xDirectionModifier; //move x position 5px
  rectY += 2 * yDirectionModifier; //move y position 10px
  
  //test if square has touched left or right edge
  //and if so, change its direction modifier to reverse
  //movement along x axis
  if (rectX == width - 10) {
    xDirectionModifier = (-1); //make increments (decrements?) negative
    red = random(0, 255); //redness changes
  } else if (rectX == 10) {
    xDirectionModifier = 1; //make increments positive
    green = random(0, 255); //greenness changes
  }
  
  //test if square has touched top or bottom edge
  //and if so, similarly reverse its direction
  if (rectY == height - 10) {
    yDirectionModifier = (-1); //make increments negative
    blue = random(0, 255); //blueness changes
  } else if (rectY == 10) {
    yDirectionModifier = 1; //make increments positive
    green = random(0, 255); //greenness and blueness both change
    blue = random(0, 255);
  }
  
  fill(red, green, blue); //light blue
  rect(rectX, rectY, 20, 20); //draw square whose edges are 10px from its origin
}
