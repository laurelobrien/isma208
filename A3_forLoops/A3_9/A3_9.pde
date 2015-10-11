/*
A3_9
Laurel O'Brien
laureljobrien@gmail.com
10/11/15
Count the number of mouse presses in the canvas and use that
to change the number of shapes drawn for each frame 
such that more mouse presses means more shapes.
*/

//declare and initialize
int pressCount = 1;

void setup()
{
  background(255);//white
  rectMode(CENTER); //draw rectangles from their center
  noStroke(); //remove stroke
  frameRate(10); //reduce framerate
}

void draw() 
{
  //for every frame that the mouse is pressed:
  if (mousePressed) {
    pressCount ++; //increment pressCount by 1
  }
  
  //draw rectangles in a random position inside canvas, their number increasing
  //each frame the longer the mouse has been pressed at any time
  for (int i = 0; i < pressCount; i ++) {
    fill(random(0, 255), random(0, 255), random(0, 255), 50); //random colour, ~19.6% opacity
    rect(random(10, width-10), random(10, height-10), 20, 20); //draw 20x20 rectangle never exceeding canvas
  }
}

