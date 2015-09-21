/* Class2_4
Laurel O'Brien
laureljobrien@gmail.com
09/21/15
Draw a 50% opacity rectangle on a black background
at the location of the mouse pointer that increases in redness.
*/

int rectColour; //declare rectColor

void setup() {
  size(500, 500); //make canvas 500x500px
  rectColour = 0; //start rectColour at 0
}

void draw() {
  background(0, 0, 0); //black background
  fill(rectColour, 0, 0, 128  ); //50% opacity fill with rectColour in place of red
  rect(mouseX, mouseY, 30, 30); //draw 30x30px rectangle at point position
  rectColour = (rectColour+1) % 255; //increment rectColour by 1 until it reaches 255
}

