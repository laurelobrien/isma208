/*
A1_7
Laurel O'Brien
laureljobrien@gmail.com
Finished 09/14/15
Draw an ellipse whose center is in the center of the canvas with
at least 8 lines radiating from the center.
*/

strokeWeight(4); // cartoony outline
fill(#ffff00);  // yellow fill
ellipse(50, 50, 30, 30);

// diagonal line: right to left
line(50, 50, 80, 20);
line(50, 50, 20, 80);

// diagonal line: left to right
line(50, 50, 80, 80);
line(50, 50, 20, 20);

// vertical line
line(50, 50, 50, 10);
line(50, 50, 50, 90);

// horizontal line
line(50, 50, 90, 50);
line(50, 50, 10, 50);
