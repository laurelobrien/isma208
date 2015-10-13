/*
A3_2
Laurel O'Brien
laureljobrien@gmail.com
10/03/15
Make a button looking shape that changes colour 
if and only if clicked on by the mouse.
*/

//declare and initialize
boolean buttonPressed = false; //toggle button's colour
color buttonColour = color(255, 0, 0); //store button colour assigned by mouseClicked()

void setup() 
{
  background(255); //white
  noStroke(); //remove stroke
  rectMode(CENTER); //draw rectangles from center
}

//draw a rectangular button that toggles between red and green when clicked
void draw() 
{
  fill(buttonColour); //set fill to colour determined in mouseClicked()
  rect(50, 50, 50, 30); //button
}

//if mouse is clicked inside button, toggle buttonPressed boolean:
void mouseClicked() {
  //determine if click happened inside button's area
  if ((mouseX > 24 && mouseX < 75) && (mouseY > 14 && mouseY < 65)) {
    //if it is, change the colour and toggle boolean's value
    if (buttonPressed == false) {
      buttonColour = color(0, 255, 0); //green
      buttonPressed = true;
    } else if (buttonPressed == true) {
      buttonColour = color(255, 0, 0); //red
      buttonPressed = false;
    }
  }
}



