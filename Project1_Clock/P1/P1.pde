/* Project 1: Accumulate
   Option 2: Non-traditional Clock
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
//declare and initialize variables
float diameter = 10; //diameter of second and minute blocks
float radius = diameter / 2; //radius of second and minute blocks

void setup() 
{
  size(960, 560); //canvas size
  rectMode(CENTER); //draw rectangles from their center
}


void draw() 
{
  background(#ffffff); //white: erase last frame
  secondBlocks();
}


void secondBlocks() 
{
  for (int i = 0; i < second(); i ++) {
    drawSixtyBlock(radius+i*radius, radius);
  }
}


//draw 46x46 cyan rectangle with white stroke
void drawSixtyBlock(float xxx, float yyy) 
{
  fill(#12deef); //cyan
  strokeWeight(2); //2px stroke
  stroke(#ffffff); //white stroke
  rect(xxx, yyy, diameter, diameter); //(x, y) args provided through function args
}
