/*
A3_3
Laurel O'Brien
laureljobrien@gmail.com
10/04/15
Make two shapes that change colour 
when the opposite shape is pressed.
*/

//initialize variables for fill() functions
int leftGrey;
int rightGrey;

//set background and stroke settings
void setup() 
{
  background(#e6e6e6); //light grey
  strokeWeight(3); //persistent thick stroke
}


//draw 2 triangles whose fill is changed if the opposite
//triangle is pressed. colour change occurs every frame and will
//not stop until the mouse press is released.
void draw() 
{
  fill(leftGrey);
  rect(10, 10, 30, 80); //left box
  
  fill(rightGrey);
  rect(60, 10, 30, 80); //right box
}

//check if mouse is pressed and if so,
//where in the window it is pressed
void mousePressed() 
{
  //if mouse horizontal position is between 10 and 40 inclusive:
  if ((mouseX > 9) && (mouseX < 41)) {
    leftGrey = 128; //make left box medium grey
  } else {
    leftGrey = 0; //otherwise, make left box black
  }
}
