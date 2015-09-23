/*
A2_1
Laurel O'Brien
laureljobrien@gmail.com
09/21/15
Create a drawing program where the 'brush' changes colour 
depending on the position in the window.
*/

//initialize integer variables for changing rgb values
int red;
int green;
int blue;

void setup() {
  background(255); //white background
}

void draw () {  
  //add mouse position to 100 to make greyish rgb values
  red = mouseX + 100; //red and green based on x position: x axis controls yellow
  green = mouseX + 100;
  blue = mouseY + 100; //blue based on y position: y axis controls blue
  
  noStroke(); //solid fill only
  fill(red, green, blue);
  ellipse(mouseX, mouseY, 10, 10);
}

