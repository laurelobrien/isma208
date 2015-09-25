/*
A2_3
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a program that draws two lines; each line starts in 
a separate corner of the canvas and ends at the mouseX, and mouseY 
position.
*/

//draw 3 lines and an ellipse with different origins and colours 
//that follow the mouse
void draw() 
{
  background(0); //'erase' previous lines from last run of draw()
  
  noStroke();
  fill(255); //white: combination of red + blue + green in rgb colourspace
  ellipse(mouseX, mouseY, 20, 20); //draw before lines to avoid obscuring their terminals
  
  
  strokeWeight(3); //make lines more visible
  stroke(255, 0, 0); //red
  line(0, 0, mouseX, mouseY); //origin in top left corner
  
  stroke(0, 255, 0); //green
  line(100, 0, mouseX, mouseY); //origin in bottom right corner
  
  stroke(0, 0, 255); //blue
  line(50, 100, mouseX, mouseY); //origin at middle of bottom edge
}
