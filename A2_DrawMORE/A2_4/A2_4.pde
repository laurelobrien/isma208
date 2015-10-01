/*
A2_4
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program that draws two shapes that move in relationship 
to the mouse in different ways.
*/


//draw eyes whose pupils mimic mouse movement vertically and horizontally,
//and whose eyebrows move opposite to the mouse vertically
void draw() 
{
  background(#F7A7A7); //pink bg: erase last drawing from draw()
  
  //set visual styles
  stroke(#FFFFFF); //white
  strokeWeight(2); //medium thickness
  noFill(); //"line drawing" appearance
  
  //2 identical stroked ellipses with origins 25px from left or right edges
  ellipse(25, 50, 30, 20); //left eye
  ellipse(75, 50, 30, 20); //right eye
  
  //switch from line art to solid shapes
  noStroke();
  fill(#FFFFFF); //white
  
  //solid 10px ellipses aligned on x axis with eye outlines, follow mouse vertically
  //(mouseY * 0.1) makes argument 10% of mouseY position to reduce the range of possible motion
  ellipse(20 + (mouseX * 0.1), 45 + (mouseY * 0.1), 10, 10); //left pupil
  ellipse(70 + (mouseX * 0.1), 45 + (mouseY * 0.1), 10, 10); //right pupil
  
  stroke(#FFFFFF); //white
  strokeWeight(2);
  //y coord minus, instead of plus, 10% of mouse y position moves point vertically opposite of the mouse
  line(11, 30 - (mouseY * 0.1), 38, 30 - (mouseY * 0.1)); //left eyebrow
  line(61, 30 - (mouseY * 0.1), 88, 30 - (mouseY * 0.1)); //right eyebrow
}
