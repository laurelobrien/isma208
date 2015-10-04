/*
A3_1
Laurel O'Brien
laureljobrien@gmail.com
10/03/15
Draw a 4 x 4 grid using for loops.
*/

//initialize variables
int linePos; //holds iterations to translate line()'s

void setup() 
{
  background(#333333); //dark grey
  stroke(#FFFFFF); //persistent white stroke
}

//draw a 4x4 grid of white lines running edge to edge
void draw() 
{
  //increase linePos by 20 every loop until it equals 80
  for (linePos = 20; linePos <= 80; linePos += 20) {
    line(0, linePos, 99, linePos); //horizontal lines
    line(linePos, 0, linePos, 99); //vertical lines
  }
}
