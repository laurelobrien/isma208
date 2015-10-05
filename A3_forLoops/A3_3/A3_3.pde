/*
A3_3
Laurel O'Brien
laureljobrien@gmail.com
10/04/15
Make two shapes that change colour 
when the opposite shape is pressed.
*/

//initialize variables
float leftGrey; //storing value for fill()
float rightGrey;
boolean leftBoundary = false; //storing state of mouse position
boolean rightBoundary = false;

//set background and stroke settings
void setup() 
{
  background(#e6e6e6); //light grey
  strokeWeight(3); //persistent thick stroke
  frameRate(12); //slowed framerate
}

//draw 2 rectangles whose fill is changed if the opposite
//rectangle is pressed. colour change occurs every frame and will
//not stop until the mouse press is released, and will reset 
//to a black fill when released
void draw() 
{
  fill(leftGrey);
  rect(10, 10, 30, 80); //left box
  
  fill(rightGrey);
  rect(60, 10, 30, 80); //right box
  
  //assign RGB-compatible values to leftGrey or rightGrey if mouse
  //is being pressed and its location inside a shape is true
  if ((mousePressed) && (leftBoundary == true)) {
    rightGrey = random(0, 255);
  } else if ((mousePressed) && (rightBoundary == true)) {
    leftGrey = random(0, 255);
    //if mouse is not pressed in left or right box respectively:
  } else {
    leftGrey = 0; //reset to black fill
    rightGrey = 0;
  }
  
  //assign a boolean variable that indicates if the mouse
  //is inside or outside each rect()
  if (((mouseX > 9) && (mouseX < 41)) && ((mouseY > 9) && (mouseY < 91))) {
    leftBoundary = true; //mouse is inside left rect()
  }
  if (((mouseX > 59) && (mouseX < 91)) && ((mouseY > 9) && (mouseY < 91))) {
    rightBoundary = true;
  }
}
