/* Project 1: Accumulate
   Option 2: Non-traditional Clock
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
//declare and initialize variables
float diameter = 15; //diameter of second and minute blocks
float radius = diameter / 2; //radius of second and minute blocks
float hourDiameter = diameter * 2.5; //hour blocks 2.5x taller than second blocks to fill same container
float hourRadius = hourDiameter / 2; //radius of hour blocks
float dayDiameter = diameter * 2; //day blocks 2x taller than second blocks
float dayRadius = dayDiameter / 2; //radius of day blocks
float monthDiameter = diameter * 5; //month blocks 5x taller than second blocks
float monthRadius = monthDiameter / 2; //radius of month blocks
float yearDiameter = 30;
float yearRadius = yearDiameter / 2;

float strokeThickness = 2; //goes in strokeWeight()
float strokeBuffer = strokeThickness / 2; //buffer around stroked shape due to centered stroke alignment
color secondsOrMinutes = color(0, 255, 255); //colour of fill for drawSixtyBlock()


//initial values and settings
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
  countMinutes();
  countHours();
  countDays();
  countMonths();
  countYears();
}


//draw a grid "container" for each unit of time filled with enough grey cells
//to contain the maximum parts of that single unit.
//e.g. container for minutes has 60 cells and container for hours has 24 cells
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
      drawSixtyContainerBlock((diameter * 8) + (i * diameter), radius + (j * diameter)); //draw a grey placeholder block
    }
  }
  
  //HOUR CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 4 rows:
    for (int j = 0; j < 4; j++) {
      drawTwentyFourContainerBlock((diameter * 16) + (i * diameter), hourRadius + (j * hourDiameter)); //draw a grey placeholder block
    }
  }
  
  //DAY CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 5 rows:
    for (int j = 0; j < 5; j++) {
      drawThirtyContainerBlock((diameter * 24) + (i * diameter), dayRadius + (j * dayDiameter)); //draw a grey placeholder block
    }
  }
  
  //MONTH CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 2 rows:
    for (int j = 0; j < 2; j++) {
      drawTwelveContainerBlock((diameter * 32) + (i * diameter), monthRadius + (j * monthDiameter)); //draw a grey placeholder block
    }
  }
  
  //YEAR CONTAINER
  //for 10 columns:
  for (int i = 0; i < 10; i++) {
    //for 9 rows:
    for (int j = 0; j < 9; j++) {
      drawNinetyContainerBlock(yearRadius + (i * yearDiameter), diameter*12 + (j * yearDiameter)); //draw a grey placeholder block
    }
  }
}

//draw 1 block for every unit currently being counted by the computer's clock. 
//each new block appears next to the previous and
//they are all erased when their unit of time "wraps" automatically;
//i.e. 12:53:59 -> 12:54:00 displays the second container emptying but the minute container gaining 1 block.
void countSeconds() 
{
  secondsOrMinutes = color(0, 255, 255); //cyan: assign fill variable used in drawSixtyBlock()
  //increment i when second() increases
  for (int i = 0; i < second(); i++) {
    drawSixtyBlock(radius + (second() % 6) * diameter, radius); //draw second block in grid location corresponding to second() value
  }
}


void countMinutes() 
{
  secondsOrMinutes = color(255, 0, 255); //magenta: assign fill variable used in drawSixtyBlock()
  for (int i = 0; i < minute(); i++) {
    drawSixtyBlock((diameter * 8) + (minute() % 6) * diameter, radius); //repeat actions for second blocks but for minutes, shifted 8 grid cells over
  }
}


void countHours() 
{
  for (int i = 0; i < hour(); i++) {
    drawTwentyFourBlock((diameter * 16) + (hour() % 4) * diameter, hourRadius);
  }
}


void countDays() 
{
  for (int i = 0; i < day(); i++) {
    drawThirtyBlock((diameter * 24) + (day() % 6 - 1) * diameter, dayRadius); //-1 accounts for day() value starting at 1 and not 0
  }
}

void countMonths() 
{
  for (int i = 0; i < month(); i++) {
    drawTwelveBlock((diameter * 32) + (month() % 6 - 1) * diameter, monthRadius); //
  }
}

void countYears() 
{
  for (int i = 0; i < month(); i++) {
    drawNinetyBlock(yearRadius + ((year() - 1994) % 10) * yearDiameter, diameter*12); //replace 1994 with user's birth year
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
  
  fill(secondsOrMinutes); //cyan or magenta
  rect(xxx, yyy, diameter - strokeThickness, diameter - strokeThickness);
}


void drawTwentyFourBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, hourDiameter); //(x, y) args provided through function args
  
  fill(#ffff00); //yellow
  rect(xxx, yyy, diameter - strokeThickness, hourDiameter - strokeThickness);
}


void drawThirtyBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, dayDiameter); //(x, y) args provided through function args
  
  fill(#000000); //black
  rect(xxx, yyy, diameter - strokeThickness, dayDiameter - strokeThickness);
}

void drawTwelveBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, monthDiameter); //(x, y) args provided through function args
  
  fill(#ff0000); //red
  rect(xxx, yyy, diameter - strokeThickness, monthDiameter - strokeThickness);
}

void drawNinetyBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, yearDiameter, yearDiameter); //(x, y) args provided through function args
  
  fill(#00ff00); //green
  rect(xxx, yyy, yearDiameter - strokeThickness, yearDiameter - strokeThickness);
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


void drawThirtyContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, dayDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter - strokeThickness * 2, dayDiameter - strokeThickness * 2);
}


void drawTwelveContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, monthDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter - strokeThickness * 2, monthDiameter - strokeThickness * 2);
}

void drawNinetyContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, yearDiameter, yearDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, yearDiameter - strokeThickness * 2, yearDiameter - strokeThickness * 2);
}