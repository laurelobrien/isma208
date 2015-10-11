/*
Write a program that changes the background colour
according to what quadrant the mouse is in
*/


//Fill the background with different colours depending on the quadrant the mouse is in,
//unless it is in the lower right quadrant, in which case a rectangle that fits it.
void draw() 
{
  //check X and Y coordinates of mouse in relation to canvas
  if ((mouseX < width/2) && (mouseY < height/2)) {
    background(255, 0, 0); //red
  } else if ((mouseX < width/2) && (mouseY > height/2)){
    background(0, 0, 255); //blue
  } else if ((mouseX > width/2) && (mouseY < height/2)) {
    background(0, 255, 0); //green
  } else if ((mouseX > width/2) && (mouseY > height/2)) {
    rect(width/2, height/2, width/2 - 1, height/2 - 1); //minus 1 from sizes to account for default stroke width
  }
}
