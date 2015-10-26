/* Project 1: Accumulate
   Option 2: Non-traditional Clock
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
//declare and initialize variables
float diameter = 15; //diameter of second and minute blocks
float radius = diameter / 2; //radius of second and minute blocks
float hourDiameter = diameter * 2.5; //diameter of hour blocks: 2.5x larger than second blocks to fill same container
float hourRadius = hourDiameter / 2; //radius of hour blocks

float strokeThickness = 2; //goes in strokeWeight()
float strokeBuffer = strokeThickness / 2; //buffer around stroked shape due to centered stroke alignment


void setup() 
{
  noStroke(); //turn off stroke
  size(960, 560); //canvas size
  rectMode(CENTER); //draw rectangles from their center
}


void draw() 
{
  background(#ffffff); //white: erase last frame
  
  drawContainers();
  countSeconds();
  

  /*countMinutes(); //draw minute blocks
  countHours(); //draw hour blocks
  //countDays();
  //countYears(); */
}

//draw a grid "container" for each unit of time filled with enough grey cells
//to contain the maximum parts of that single unit.
//eg container for minutes has 60 cells and container for hours has 24 cells
void drawContainers() 
{
  //SECOND CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 10 rows:
    for (int j = 0; j < 10; j++) {
      drawSixtyContainerBlock(radius + i * diameter, radius + j * diameter); //draw a grey placeholder block
    }
  }
  
  //MINUTE CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 10 rows:
    for (int j = 0; j < 10; j++) {
      drawSixtyContainerBlock((diameter * 8) + (i * diameter), radius + j * diameter); //draw a grey placeholder block
    }
  }
  
  //HOUR CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 4 rows:
    for (int j = 0; j < 4; j++) {
      drawTwentyFourContainerBlock((diameter * 16) + (i * diameter), hourRadius + j * hourDiameter); //draw a grey placeholder block
    }
  }
}

//draw 1 block for every second currently being counted by the computer's clock. 
//each new block appears next to the previous and
//they are all erased when their unit of time "wraps" automatically;
//i.e. 12:53:59 -> 12:54:00 displays 59 second blocks and then 0 second blocks.
void countSeconds() 
{
  for (int i = 0; i < second(); i++) {
    drawSixtyBlock(radius + (second() % 6) * diameter, radius);
  }
}


void countMinutes() 
{
  for (int i = 0; i < minute(); i ++) {
    drawSixtyBlock(i * diameter, radius + diameter);
  }
}


void countHours() 
{
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
  rect(xxx, yyy, diameter - strokeThickness, diameter - strokeThickness);
}


void drawTwentyFourBlock(float xxx, float yyy) 
{
}


void drawSixtyContainerBlock(float xxx, float yyy)
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, diameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter-strokeThickness*2, diameter-strokeThickness*2);
}


void drawTwentyFourContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, hourDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter - strokeThickness * 2, hourDiameter - strokeThickness * 2);
}