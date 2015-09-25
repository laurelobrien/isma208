/*
A2_1
Laurel O'Brien
laureljobrien@gmail.com
09/22/15
Change the fill and stroke of two shapes in different ways 
using mouseX, and mouseY.
*/



void setup() 
{
  background(128); //medium grey
}

//draw 2 triangles, changing properties of 
//stroke and fill with mouse movement

void draw()
{ 
  //declare and initialize local variables for converted mouse position into useful values
  float verticalPos = (mouseY * 0.1); //y position turned into a float between 0 and 1 presuming 100x100 canvas
  float horizontalPos = (mouseX * 2.55); //x position turned into a float between 0 and 255 for rgb colorspace
  
  background(128); //'erase' last run of draw() 
  
  noStroke();
  fill(255); //white
  ellipse(30, 32, 5, 5); //draw unchanging ellipse to test opacity of magenta triangle
  
  //magenta triangle
  strokeWeight(verticalPos); //weight increases with downwards mouse movement
  stroke(0); //black
  fill(255, 0, 255, horizontalPos); //alpha value increases with left-to-right mouse movement
  triangle(30, 20, 10, 40, 50, 40);
  
  strokeWeight(2); //clear changes to strokeWeight() from magenta triangle
  stroke((255 - horizontalPos),  255, (0 + horizontalPos)); //red and blue increase and decrease with horizontal movement, yellow to cyan
  fill((0 + horizontalPos), 255, (255 - horizontalPos)); //same action as stroke rgb values but in reverse, cyan to yellow
  triangle(70, 80, 90, 60, 50, 60);
}
