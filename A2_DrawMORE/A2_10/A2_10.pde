/*
A2_10
Laurel O'Brien
laureljobrien@gmail.com
09/25/15
Create a motion graphics composition, which uses different shapes. 
Play with colour, size, and movement.
*/

void draw() 
{
  background(255); //yellow: erase last frame
  
  noStroke();
  fill(255, 255, 0); //red
  arc(35, 65, 50, 50, 7*(-PI)/4, (-PI)/4, PIE); //arc with PIE mode connecting its start and stop points to its center
}
