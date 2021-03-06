/*
A3_6
Laurel O'Brien
laureljobrien@gmail.com
10/05/15
Use a for loop and a random number generator to draw 100 shapes.
*/


//declare and initialize
int diameter = 10; //diameter of ellipse
int radius = diameter / 2; //radius of ellipse
int rowCount = 0; //number of rows filled with ellipses
int columnCount; //number of columns filled in a row


void setup() 
{
  noStroke(); //remove stroke
  background(255); //white
}


//fill the canvas with 100 pieces of confetti (ellipses) that touch each other
//without overlapping or exceeding the canvas bounds.
//every time the program is run, they will each be a different random colour.
void draw() 
{
  //repeat for 100 iterations and then stop
  for (int i = 0; i < 100; i++) {
    fill(random(0, 255), random(0, 255), random(0, 255)); //re-randomize fill values
    ellipse(radius + (columnCount * diameter), radius + (rowCount * diameter), diameter, diameter); //draw ellipse moving right until it hits canvas boundary, moves down, and resets to left edge
    
    columnCount ++; //column is filled in with a piece of confetti
    
    //determine if the last column in a row is filled
    if ((columnCount * diameter) > (width - radius)) {
      columnCount = 0; //reset x position to first "column"
      rowCount ++; //move down to start filling in next row
    }
  }
}
