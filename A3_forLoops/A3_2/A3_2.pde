/* COMPLETE BUT BORING */

/*
A3_2
Laurel O'Brien
laureljobrien@gmail.com
10/03/15
Make a button looking shape that changes colour 
if and only if clicked on by the mouse.
*/

//initialize a variable to store changes in fill colour
float ranFill;

void setup() 
{
  noStroke(); //remove stroke: allow illusion of compound shapes
  rectMode(CENTER); //draw rectangles from center
}

//draw a 3d-looking button whose face changes to a random
//shade of grey when the mouse is clicked anywhere inside the window
void draw() 
{
  fill(15, 128, 15); //dark green
  rect(50, 50, 40, 20); //height of button
  
  fill(15, 128, 15); //dark green
  ellipse(50, 60, 40, 30); //base of button
  
  fill(ranFill); //3 identical, random variables in RGB colourspace
  ellipse(50, 40, 40, 30); //button face
}

//if mouse is clicked:
void mouseClicked() {
  ranFill = random(0, 255); //assign new random value to ranFill
}



