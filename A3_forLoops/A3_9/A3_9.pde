/*
A3_9
Laurel O'Brien
laureljobrien@gmail.com
10/12/15
Count the number of mouse presses in the canvas and use that
to change the number of shapes drawn for each frame 
such that more mouse presses means more shapes.
*/

/*
I interpreted "number of mouse presses" to mean the number
of frames during which the mouse is pressed (such that holding the mouse down
continues to increment squares drawn every frame like a volume button). 
If it was individual mouse presses I would only increment pressCount
inside a definition of mouseClicked().
*/

//declare and initialize
int pressCount = 1;
int diameter = 20; //'diameter' of square drawn from center
int radius = diameter/2; //'radius' of square drawn from center

void setup()
{
  background(255);//white
  rectMode(CENTER); //draw rectangles from their center
  noStroke(); //remove stroke
  frameRate(10); //reduce framerate
}

//draw colourful, translucent squares with a random position every frame.
//the number of squares drawn per frame permanently increases the longer the 
//mouse is pressed inside the canvas.
void draw() 
{
  //for every frame that the mouse is pressed:
  if (mousePressed) {
    pressCount ++; //increment pressCount by 1
  }
  
  //draw a number of randomly-positioned squares equal to pressCount
  for (int i = 0; i < pressCount; i ++) {
    fill(random(0, 255), random(0, 255), random(0, 255), 50); //random colour, ~19.6% opacity
    rect(random(10, width-radius), random(10, height-radius), diameter, diameter); //draw square never exceeding canvas bounds
  }
}

