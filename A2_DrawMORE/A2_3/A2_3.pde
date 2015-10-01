/*
A2_3
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program that draws two lines; each line starts in 
a separate corner of the canvas and ends at the mouseX, and mouseY 
position.
*/

//draw 2 lines that originate in top left and top right corners, 
//plus a third line and an ellipse that all follow the mouse
//to show white where red, green, and blue meet
void draw() 
{
  background(0); //'erase' previous lines from last run of draw()
  
  noStroke();
  fill(255); //white: combination of red + blue + green in RGB colourspace
  ellipse(mouseX, mouseY, 20, 20); //draw before lines to avoid obscuring their terminals
  
  
  strokeWeight(3); //make lines more visible
  stroke(255, 0, 0); //red
  line(0, 0, mouseX, mouseY); //origin in top left corner
  
  stroke(0, 255, 0); //green
  line(99, 0, mouseX, mouseY); //origin in top right corner
  
  stroke(0, 0, 255); //blue
  line(50, 99, mouseX, mouseY); //origin at middle of bottom edge
}
