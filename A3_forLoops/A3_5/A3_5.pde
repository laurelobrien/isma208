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
int diameter = 20; //'diameter' of a rectangle drawn from the center
int radius = diameter/2; //'radius' of a rectangle drawn from the center

int xDirectionModifier = 1; //indicate positive or negative movement
int yDirectionModifier = 1;

//variables for making random fill
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
  
  //reset x, y coordinates to 50 while mouse is pressed
  if (mousePressed) {
    rectX = 50;
    rectY = 50;
  } 
  
  rectX += 1 * xDirectionModifier; //move x position 1px
  rectY += 2 * yDirectionModifier; //move y position 2px
  
  //test if square has touched left or right edge
  //and if so, change its direction modifier to reverse
  //movement along x axis
  if (rectX == width - radius) {
    xDirectionModifier = (-1); //make increments (decrements?) negative
    red = random(0, 255); //redness changes
  } else if (rectX == radius) {
    xDirectionModifier = 1; //make increments positive
    green = random(0, 255); //greenness changes
  }
  
  //test if square has touched top or bottom edge
  //and if so, similarly reverse its direction
  if (rectY == height - radius) {
    yDirectionModifier = (-1); //make increments negative
    blue = random(0, 255); //blueness changes
  } else if (rectY == radius) {
    yDirectionModifier = 1; //make increments positive
    green = random(0, 255); //greenness and blueness both change
    blue = random(0, 255);
  }
  
  fill(red, green, blue); //light blue
  rect(rectX, rectY, diameter, diameter); //draw square whose edges are 10px from its origin
}
