/*
A2_9
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a shape that changes colour and size such that the rate 
of change is determined by the mouseX and mouseY position, 
respectively. Ensure the colour and size wrap around different 
arbitrary values.
*/

//initialize variables to change colour value and shape coordinates
int yellow = 0;
int leftCornerX = 0;
int leftCornerY = 0;
int rightCornerX = 0;
int rightCornerY = 0;

//draw a trapezoid which expands into a square and wraps back to its original
//trapezoid shape before it would become another (reversed) trapezoid. the speed with which
//it makes this transformation is controlled by mouse X position.
void draw() 
{
  background(128); //medium grey
  noStroke();
  
  fill(242, 211, 164); //peach
  quad(90, 10, (55 + rightCornerX) % 90, (20 + rightCornerY) % 90, (45 - leftCornerX), (20 + leftCornerY) % 90, 10, 10);
  
  
  /*
  how can I wrap a value that's decreasing? leftCornerX needs to be subtracted
  from its coordinate to move the point left, and cannot go lower than 
  10 to keep it consistent with the right point wrapping @ 90 on the other side.
  but controlling wrap with modulus only seems to work  as a greater-than/remainder
  parameter. if statement below doesn't quite work, might be because of floats 
  rolling leftCornerX back to 0 at a different time than rightCornerX
  */
  leftCornerX += mouseX * 0.5; //increments by 5% of mouse x position to move left
  leftCornerY += mouseX * 0.05; //increments by 5% of mouse x position to move down
  rightCornerX += mouseX * 0.05; //increments by 5% of mouse x position to move right
  rightCornerY += mouseX * 0.05; //increments by 5% of mouse x position to move down
  
  //check if leftCornerX has exceeded 10, and if so, reduce to 0
  if (leftCornerX > 35) 
  {
    leftCornerX = 0;
  }
}
