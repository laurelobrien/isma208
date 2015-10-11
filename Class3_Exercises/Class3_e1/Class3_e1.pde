int otherSize;

void setup

void draw() 
{
  background(128); //medium grey, erase last frame
  
  ellipse(50, 50, otherSize, otherSize); //draw ellipse with variable width and height
  
  //if variable used for diameter is 100 or higher, reset variable to 0
  //if it is less than 100, add 1 to that variable
  if (otherSize == 99) {
    otherSize = 0;
}
