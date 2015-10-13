/*
A3_1
Laurel O'Brien
laureljobrien@gmail.com
10/03/15
Draw a 4 x 4 grid using for loops.
*/

//declare and initialize
int linePos; //holds iterations to 'translate' line()

void setup() 
{
  background(#333333); //dark grey
  stroke(#FFFFFF); //persistent white stroke
}

//draw a 4x4 grid divided by white lines running edge to edge.
void draw() 
{
  //increase linePos by 25 and draw a line() every loop until it has created 4 cells
  for (int linePos = 25; linePos <= 75; linePos += 25) {
    line(0, linePos, 99, linePos); //horizontal lines
    line(linePos, 0, linePos, 99); //vertical lines
  }
}
