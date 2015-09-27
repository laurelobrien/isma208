/*
A2_10
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a motion graphics composition, which uses different shapes. 
Play with colour, size, and movement.
*/

//initialize variables
int colourBar = 0;
int ripple = 0;
int frameMemory = 0; //store previous draw()'s frameCount
boolean rainbowDown = false;


//draw pac-man vomitting a rainbow off the right edge of the canvas 
//that undulates up and down every 10 frames
void draw() 
{
  frameMemory ++; //keep count of frames for future comparison
  background(255); //white: erase last frame
  noStroke();
  
  fill(255, 0, 0); //red
  rect(35, (45 + ripple), (1 + colourBar), 3);
  
  fill(255, 128, 0); //orange
  rect(35, (48 + ripple), (1 + colourBar), 3);
  
  fill(255, 255, 0); //yellow
  rect(35, (51 + ripple), (1 + colourBar), 3);
  
  fill(0, 255, 0); //green
  rect(35, (54 + ripple), (1 + colourBar), 3);
  
  fill(0, 0, 255); //blue
  rect(35, (57 + ripple), (1 + colourBar), 3);
  
  fill(255, 0, 255); //violet
  rect(35, (60 + ripple), (1 + colourBar), 3);
  
  stroke(0); //black
  strokeWeight(2); //cartoony outline
  fill(255, 255, 0); //yellow
  arc(35, 54, 50, 50, 7*(-PI)/4, (-PI)/4, PIE); //arc with PIE mode connecting its start and stop points to its center
  
  noStroke();
  fill(0); //black
  ellipse(25, 43, 7, 7); //eye
  
  colourBar += 2; //extend rainbow 2 pixels to the right
  
  if (((frameCount % 10) == 0) && (rainbowDown == false)) //every 10th frame, if rainbowDown boolean has not been turned on...
  {
    ripple = 3; // move rainbow stream down via y coordinate, appears to undulate
    rainbowDown = true; //turn on rainbowUp boolean 
  } 
  else if (((frameCount % 10) == 0) && (rainbowDown == true))  //every 10th frame, if rainbowDown boolean HAS been turned on...
  {
    ripple = 0; //return rainbow stream to starting y coordinate
    rainbowDown = false; //turn off rainbowDown boolean
  }
}
