/* Project 1: Accumulate
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

/*
draw a grid "container" for each common unit of time, from seconds to years.
inside each grid, fill a cell with colour to indicate it has been counted towards a whole unit.
empty the grid when it maxes out and increase the coloured cell count of the next largest unit.
continue in this way so that time is always accounted for in some unit or another 
until there are no units left.
*/
void draw() 
{
  background(#ffffff); //white: erase last frame
  
  pushMatrix(); //isolate memory for transformations
  translate(50, 50); //move following functions 100 px right and down to create margin
  
  //call functions 
  drawContainers(); //draw grey "empty" unit containers
  countSeconds(); //draw blocks for each count of seconds
  countMinutes(); //repeat for minutes
  countHours(); //repeat for hours
  countDays(); //repeat for days
  countMonths(); //repeat for months
  countYears(); //repeat for years
  
  popMatrix(); //done isolating memory for transformations
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


/* FILLING IN COLOURED CELLS
draw 1 block for every unit currently being counted by the computer's clock within its grid.
each new block appears next to the previous 
and they are each erased when their unit of time "wraps" automatically.
i.e. 12:53:59 -> 12:54:00 displays the second container emptying but the minute container gaining 1 block.
*/
//seconds
void countSeconds() 
{
  secondsOrMinutes = color(242, 240, 132); //yellow: assign fill variable used in drawSixtyBlock()
  //increment i when second() increases
  for (int i = 0; i < second(); i++) {
    drawSixtyBlock(radius + (second() % 6) * diameter, radius); //draw second block in grid location corresponding to second() value
  }
}

//minutes
void countMinutes() 
{
  secondsOrMinutes = color(247, 208, 132); //light orange: assign fill variable used in drawSixtyBlock()
  for (int i = 0; i < minute(); i++) {
    drawSixtyBlock((diameter * 8) + (minute() % 6) * diameter, radius); //repeat actions for second blocks but for minutes, shifted 8 grid cells over
  }
}

//hours
void countHours() 
{
  for (int i = 0; i < hour(); i++) {
    drawTwentyFourBlock((diameter * 16) + (hour() % 4) * diameter, hourRadius);
  }
}

//days
void countDays() 
{
  for (int i = 0; i < day(); i++) {
    drawThirtyBlock((diameter * 24) + (day() % 6 - 1) * diameter, dayRadius); //-1 accounts for day() value starting at 1 and not 0
  }
}

//months
void countMonths() 
{
  for (int i = 0; i < month(); i++) {
    drawTwelveBlock((diameter * 32) + (month() % 6 - 1) * diameter, monthRadius); //
  }
}

//years
//year blocks have their count determined by the user's birth year vs current year
//and their container size determined by a generous human lifespan.
void countYears() 
{
  for (int i = 0; i < year(); i++) {
    drawNinetyBlock(yearRadius + ((year() - 1994) % 10) * yearDiameter, diameter*13); //replace 1994 with user's birth year
  }
}


/* DRAW "CONTAINERS": EMPTY GRIDS
draw diameter x diameter rectangle with white fill, and
an inset rectangle with coloured fill to mitigate the dimension difficulties 
caused by using stroke() and strokeWeight().
all blocks are based on either the diameter of second/minute blocks, or a product thereof.
*/
//second and minute blocks
void drawSixtyBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, diameter); //(x, y) args provided through function args
  
  fill(secondsOrMinutes); //yellow or light orange
  rect(xxx, yyy, diameter - strokeThickness, diameter - strokeThickness);
}

//hour blocks
void drawTwentyFourBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, hourDiameter); //(x, y) args provided through function args
  
  fill(#ff9d7b); //orange
  rect(xxx, yyy, diameter - strokeThickness, hourDiameter - strokeThickness);
}

//day blocks
void drawThirtyBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, dayDiameter); //(x, y) args provided through function args
  
  fill(#e95c63); //light red
  rect(xxx, yyy, diameter - strokeThickness, dayDiameter - strokeThickness);
}

//month blocks
void drawTwelveBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, diameter, monthDiameter); //(x, y) args provided through function args
  
  fill(#d15260); //dark red
  rect(xxx, yyy, diameter - strokeThickness, monthDiameter - strokeThickness);
}

//year blocks
void drawNinetyBlock(float xxx, float yyy) 
{
  fill(#ffffff); //white
  rect(xxx, yyy, yearDiameter, yearDiameter); //(x, y) args provided through function args
  
  fill(#445eb4); //navy blue
  rect(xxx, yyy, yearDiameter - strokeThickness, yearDiameter - strokeThickness);
}

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
