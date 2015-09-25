/*
A2_4
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program that draws two shapes that move in relationship 
to the mouse in different ways.
*/

void draw() 
{
  background(#F7A7A7); //pink bg: erase last drawing from draw()
  
  //set visual styles
  stroke(#FFFFFF); //white
  strokeWeight(2); //medium thickness
  noFill(); //"line drawing" appearance
  
  //2 identical stroke ellipses with origins 25px from left or right edges
  ellipse(25, 50, 30, 20); //left eye
  ellipse(75, 50, 30, 20); //right eye
  
  //switch from line art to solid shapes
  noStroke();
  fill(#FFFFFF);
  
  //solid 10px ellipses aligned on x axis with eye outlines, follow mouse vertically
  ellipse(25, mouseY, 10, 10); //left pupil
  ellipse(75, mouseY, 10, 10); //right pupil
}
