/* 
Example 1
10/26/15

use a function with a return value to wrap an increasing
variable value
*/

int counter = 0;

int wrap(int value, int increment, int upperLimit) {
  return(value + increment) % upperLimit;
}

void draw() {
  background(255);
  ellipse(counter, height/2, 30, 30);
  //counter = (counter + 1) % 100;
  counter = wrap(counter, 1, 100);
}

