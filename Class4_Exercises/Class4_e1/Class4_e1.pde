/*
Class 4, E1
laureljobrien@gmail.com
Laurel O'Brien
10/05/2015
Use a for loop to draw a row of 10 small ellipses
*/

//initialize variables
int i;
int ellipseBoundary = 50;
int diam = width / (ellipseBoundary); //diameter of ellipse repeated within ellipseBoundary will fit width perfectly
int radiusOffset = diam / 2; //ellipse starting position is half its diameter because it's drawn from the center

noStroke(); //remove stroke

//for every iteration, add one to i and perform actions
//until iteration has been performed 10 times
for (i = 0; i < ellipseBoundary; i++) {
  fill((0 + (i * 20)) % 255); //fill with greyscale colour that becomes lighter with each iteration
  ellipse(radiusOffset + (i*diam), 50, diam, diam); //draw an ellipse whose origin and diameter moves with each iteration
}
