/*
A2_1
Laurel O'Brien
laureljobrien@gmail.com
09/22/15
Change the fill and stroke of two shapes in different ways 
using mouseX, and mouseY.
*/

void setup() 
{
  background(#333333); //dark grey
}

void draw()
{
  noStroke();
  
  fill(200); //dark grey, invisible against background
  triangle(30, 20, 10, 40, 50, 40);
  
  
  fill(#00FFFF); //cyan
  triangle(70, 80, 90, 60, 50, 60);
}
