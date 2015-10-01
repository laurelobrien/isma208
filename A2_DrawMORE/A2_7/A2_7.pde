/*
A2_7
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Using variables for x and y position, move four shapes 
across the canvas in different directions. Ensure the position
of the shapes wrap around the canvas dimensions.
*/

//initialize variables to calculate x and y coordinates: start shapes stacked on (50, 50)
float ellipseX = 50;
float ellipseY = 50;
float rectX = 0;
float rectY = 50;
float leftLineX = 40; //10px to left of center
float rightLineX = 60; //10px to right of center

//draw an ellipse, a circle (via ellipse), a rectangle, and a line whose
//position shifts by 1px each frame, wrapping back to the edge of the canvas
//when the entire shape has passed its opposite edge.
void draw() 
{
  background(#333333); //'erase' drawings from previous run-throughs of draw()
  
  noStroke();
  rectMode(CENTER); //draw rectangles from the center
  
  //use modulo to wrap position of shape past the edge of the canvas dimensions
  //so it appears to wrap back to the other side once it fully exits the canvas
  fill(#F7B166); //light orange
  ellipse(ellipseX % 125, 50, 50, 80); //draw ellipse moving right up to 125px
  
  fill(#9DD3F0);
  ellipse(50, ellipseY % 110, 20, 20);
  
  fill(#E79DF0); //light magenta
  rect(50, rectY, 60, 20);
  
  stroke(#9DD170); //algae green
  strokeWeight(3); //thicker stroke for visibility
  line(leftLineX, 50, rightLineX, 50);
  
  //check if rect()'s y variable has gone half its height past the top edge
  if (rectY < -10) {
    rectY = 99; //reposition rect()'s y coordinate at bottom of canvas
  }
  
  //check if line()'s x coordinates have passed the entire line()'s length
  //off the left edge of the canvas
  if (leftLineX < - 20) {
    leftLineX = 99; //move left point of line(); to the right edge
    rightLineX = 79; //it follows that rightpoint will need to wrap at same time
  }
  
  ellipseX ++; //move ellipse with x variable right
  ellipseY ++; //move ellipse() with y variable downwards
  rectY --; //move rect() upwards
  leftLineX --; //move left line() point to the left
  rightLineX --; //move right line() point to the left
}
