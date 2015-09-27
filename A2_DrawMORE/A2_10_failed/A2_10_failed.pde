/*
A2_10
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a motion graphics composition, which uses different shapes. 
Play with colour, size, and movement.
*/

int foodBlockHeight = 0; //manipulate height argument of rect();
int foodBlockY = 0; // manipulate y coordinate argument of rect();
int holdCount = 0; //record how long an animation/transformation has been 'paused'
int red = 0; //manipulate redness in rgb value
int green = 120; //
int blue = 0; //manipulate blueness in rgb value


//draw an arc that resembles an ellipse with slice removed from top.
//a green rectangle expands into its 'mouth' and is consumed, and is 
//excreted as a brown rectangle.
void draw() 
{
  background(#FFFF00); //erase last frame
  noStroke();
  fill(red, green, blue); //green, until variable red and blue are changed
  rect(40, (0 + foodBlockY), 20, 20 + foodBlockHeight); //draw rectangle whose height and y origin change over time
  
  stroke(0); //black
  strokeWeight(2); //cartoony stroke
  fill(255, 0, 0); //red
  arc(50, 65, 50, 50, (-PI)/4, 5*PI/4, PIE); //arc with PIE mode connecting its start and stop points to its center
  
  //stop lengthening rect(); when it reaches 60px and hold its
  //size for 3 seconds, or 90 frames
  if (foodBlockHeight == 65)
  {
    holdCount ++;
  } else {
    foodBlockHeight ++;
  }
  
  if ((holdCount >= 90) && (foodBlockY <= 64))
  {
    foodBlockY ++; //increment rect() y coord origin, moving it down
    foodBlockHeight -= 2; //decrement rect() height faster than previous if statement increases it, so its bottom edge appears to stay still as y origin is translated down
  }
  
  if (holdCount >= 91) 
  {
    red = 180;
    blue = 40;
  }
  
  println(holdCount);
}
