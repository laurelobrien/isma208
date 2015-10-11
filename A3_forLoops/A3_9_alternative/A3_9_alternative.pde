/*
A3_9
Laurel O'Brien
laureljobrien@gmail.com
10/11/15
Count the number of mouse presses in the canvas and use that
to change the number of shapes drawn for each frame 
such that more mouse presses means more shapes.
*/

/*
This is an alternative version that only draws shapes after mouse is pressed,
which I thought was more fun to look at
*/

//declare and initialize
int pressCount;

void setup()
{
  background(255);//white
  rectMode(CENTER); //draw rectangles from their center
  noStroke(); //remove stroke
}

//determine when a mouse press has been released
//and draw squares beneath mouse equal to the number of times
//mouse has been pressed so far
void mouseClicked() 
{
  pressCount ++; //increment count of whole presses
  
  //draw rectangles under mouse position
  //with low opacity and a degree of randomness to show shapes multiplying
  for (int i = 0; i < pressCount; i ++) {
    fill(random(0, 255), random(0, 255), random(0, 255), 50); //random colour, ~19.6% opacity
    rect(mouseX + random(0, 20), mouseY + random(0, 10), 20, 20); //draw 20x20 rectangle
  }
}

