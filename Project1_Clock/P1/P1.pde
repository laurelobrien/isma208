/* Project 1: Accumulate
   Option 2: Non-traditional Clock
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
//declare and initialize variables
float diameter = 20; //diameter of second and minute blocks
float radius = diameter / 2; //radius of second and minute blocks
float strokeThickness = 4; //goes in strokeWeight()
float strokeBuffer = strokeThickness / 2; //buffer around stroked shape due to centered stroke alignment
float unitContainerHeight = (diameter * 59) + (strokeThickness/2 * 59);
int grey = 0;

void setup() 
{
  size(960, 560); //canvas size
  rectMode(CENTER); //draw rectangles from their center
}


void draw() 
{
  background(#ffffff); //white: erase last frame
  
  //testing if unitContainerHeight is calculated correctly
  noStroke(); //remove stroke
  rectMode(CORNER); //draw rectangles from their corner
  fill(#333333); //dark grey
  rect(0, 0, unitContainerHeight, 40); //draw rect at canvas origin that can contain 60 diameter*diameter blocks with stroke
  
  secondsAndMinutes(); //draw second and minute blocks
  
  println(unitContainerHeight);
}


void secondsAndMinutes() 
{
  fill(#12deef); //cyan
  for (int i = 0; i < second(); i ++) {
    drawSixtyBlock(i*(diameter+strokeBuffer), radius);
  }
  
  fill(#FF00FF); //magenta
  for (int i = 0; i < minute(); i ++) {
    drawSixtyBlock(i*(diameter+strokeBuffer), radius+diameter+strokeBuffer);
  }
}


//draw 46x46 cyan rectangle with white stroke.
//60 of these fit inside a "unit container"
void drawSixtyBlock(float xxx, float yyy) 
{
  strokeWeight(strokeThickness);
  stroke(#ffffff); //white stroke
  rect(xxx, yyy, diameter, diameter); //(x, y) args provided through function args
}
