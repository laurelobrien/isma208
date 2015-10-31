/* Project 1: Accumulate VERSION 2
   Option 2: Non-traditional Clock
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
//declare and initialize variables
float birthYear = 1994; //initialize this with your own birth year if you're feeling morbid

float diameter = 15; //diameter of second and minute blocks
float radius = diameter / 2; //radius of second and minute blocks
float hourDiameter = diameter * 2.5; //hour blocks 2.5x taller than second blocks to fill same container
float hourRadius = hourDiameter / 2; //radius of hour blocks
float dayDiameter = diameter * 2; //day blocks 2x taller than second blocks
float dayRadius = dayDiameter / 2; //radius of day blocks
float monthDiameter = diameter * 5; //month blocks 5x taller than second blocks
float monthRadius = monthDiameter / 2; //radius of month blocks
float yearDiameter = diameter * 2.5;
float yearRadius = yearDiameter / 2;

float strokeThickness = 3; //goes in strokeWeight()
float strokeBuffer = strokeThickness / 2; //buffer around stroked shape due to centered stroke alignment
color secondsOrMinutes = color(0, 255, 255); //colour of fill for drawSixtyBlock()


//initial values and settings
void setup() 
{
  noStroke(); //turn off stroke
  size(663, 505); //canvas size
  rectMode(CENTER); //draw rectangles from their center
}


void draw() 
{
  background(#ffffff); //white: erase last frame
  
  drawContainers(); //draw grid containers for each unit
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
      //draw a grey placeholder block in each column by row, with (radius +) to account for rectMode(CENTER)
      drawSixtyContainerBlock(radius + i * diameter, radius + j * diameter);
    }
  }
  
  //MINUTE CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 10 rows:
    for (int j = 0; j < 10; j++) {
      //replace (radius +) with ((diameter * 8) +) to space container 2 cells away from previous 6-cell container
      drawSixtyContainerBlock((diameter * 8) + (i * diameter), radius + (j * diameter)); //draw a grey placeholder block
    }
  }
  
  //HOUR CONTAINER
  //for 6 columns:
  for (int i = 0; i < 6; i++) {
    //for 4 rows:
    for (int j = 0; j < 4; j++) {
      //keep width of second and minute diameter, but lengthen cell with new hourDiameter
      drawTwentyFourContainerBlock((diameter * 16) + (i * diameter), hourRadius + (j * hourDiameter));
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
  //for 15 columns:
  for (int i = 0; i < 15; i++) {
    //for 6 rows:
    for (int j = 0; j < 6; j++) {
      //year container has its own diameters, and is placed 13 cells below the smaller containers
      //with a width equal to the sum of all smaller containers plus a margin: diameter*13
      drawNinetyContainerBlock(yearRadius + (i * yearDiameter), diameter*13 + (j * yearDiameter)); //draw a grey placeholder block
    }
  }
}

/* DRAW INDIVIDUAL CONTAINER BLOCKS
----------------------------------------*/
//second and minute CONTAINER blocks
void drawSixtyContainerBlock(float xxx, float yyy)
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, diameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter-strokeThickness*2, diameter-strokeThickness*2);
}

//hour CONTAINER blocks
void drawTwentyFourContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, hourDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter - strokeThickness * 2, hourDiameter - strokeThickness * 2);
}

//day CONTAINER blocks
void drawThirtyContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, dayDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter - strokeThickness * 2, dayDiameter - strokeThickness * 2);
}

//month CONTAINER blocks
void drawTwelveContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, monthDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, diameter - strokeThickness * 2, monthDiameter - strokeThickness * 2);
}

//year CONTAINER blocks
void drawNinetyContainerBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, yearDiameter, yearDiameter);
  
  fill(#e6e6e6); //light grey
  rect(xxx, yyy, yearDiameter - strokeThickness * 3, yearDiameter - strokeThickness * 3);
}