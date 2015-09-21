/*
A1_4
Laurel O'Brien
laureljobrien@gmail.com
Finished 09/14/15
Draw 2 diagonal lines that intersect at the centre of the canvas.
*/

stroke(0x600000FF); // hex red with 60% alpha value
strokeWeight(4); // create enough width for all following lines to see overlap
line(10, 10, 90, 90);

stroke(0x60FF0000); // hex blue with 60% alpha value
line(10, 90, 90, 10);
