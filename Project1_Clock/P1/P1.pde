/* Project 1: Accumulate
   Option 2: Non-traditional Clock
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
//declare and initialize variables
float diameter = 15; //diameter of second and minute blocks
float radius = diameter / 2; //radius of second and minute blocks
float strokeThickness = 2; //goes in strokeWeight()
float strokeBuffer = strokeThickness / 2; //buffer around stroked shape due to centered stroke alignment
float unitContainerHeight = (diameter * 59) + (strokeThickness/2 * 59);
float hourDiameter = unitContainerHeight / 23;

void setup() 
{
  noStroke(); //turn off stroke
  size(960, 560); //canvas size
  rectMode(CENTER); //draw rectangles from their center
}


void draw() 
{
  background(#333333); //white: erase last frame
  
  drawContainers();
  countSeconds();
  
  /*countSeconds(); //draw second blocks
  countMinutes(); //draw minute blocks
  countHours(); //draw hour blocks
  //countDays();
  //countYears(); */
}


void drawContainers() 
{
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 10 rows:
    for (int j = 0; j < 10; j++) {
      drawContainerBlock(radius + i * diameter, radius + j * diameter); //draw a grey placeholder block
    }
  }
}

//draw 1 block for every second currently being counted by the computer's clock. 
//each new block appears next to the previous and
//they are all erased when their unit of time "wraps" automatically;
//i.e. 12:53:59 -> 12:54:00 displays 59 second blocks and then 0 second blocks.
void countSeconds() 
{
  //these for loops currently draw entire columns per second
  for (int j = 0; j < 6; j++) {
    for (int i = 0; i < second(); i ++) {
      drawSixtyBlock(radius + i * diameter, radius + j * diameter);
    }
  }
}


void countMinutes() 
{
  for (int i = 0; i < minute(); i ++) {
    drawSixtyBlock(i*(diameter+strokeBuffer), radius+diameter+strokeBuffer);
  }
}


void countHours() 
{
 fill(#FFFF00);
 for (int i = 0; i < hour(); i ++) {
    drawTwentyFourBlock(i*(hourDiameter+strokeBuffer), hourDiameter/2+(diameter+strokeBuffer)*2);
 }
}


//draw diameter x diameter rectangle with white fill, and
//an inset rectangle with coloured fill to mitigate the dimension difficulties 
//caused by using stroke() and strokeWeight().
//60 of these blocks fit inside a "unit container".
void drawSixtyBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, diameter); //(x, y) args provided through function args
  
  fill(#12deef); //cyan
  rect(xxx, yyy, diameter-strokeThickness, diameter-strokeThickness);
}


void drawTwentyFourBlock(float xxx, float yyy) 
{
  rect(xxx, yyy, hourDiameter, hourDiameter);
  rect(xxx, yyy, hourDiameter-strokeThickness, hourDiameter-strokeThickness);
}


void drawContainerBlock(float xxx, float yyy)
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, diameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter-strokeThickness*2, diameter-strokeThickness*2);
}