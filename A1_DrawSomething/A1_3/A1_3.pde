/*
A1_3
Laurel O'Brien
laureljobrien@gmail.com
Finished 09/14/15
Draw 2 straight lines that intersect at the center of the canvas.
*/

/*
stroke()'s alpha argument indicates where the lines overlap 
by creating a new colour: 60% red plus 60% blue
*/
stroke(0x600000FF); // first 2 digits after 0x define 60% alpha value
strokeWeight(4); // create enough width to see translucent overlap
line(10, 50, 90, 50);

stroke(0x60FF0000);
strokeWeight(4);
line(50, 10, 50, 90);
