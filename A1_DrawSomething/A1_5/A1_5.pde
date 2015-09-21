/*
A1_5
Laurel O'Brien
laureljobrien@gmail.com
Finished 09/14/15
Draw an ellipse in each of the four corners of the canvas.
*/

noStroke(); // monochrome ellipses with only fill, no stroke

/* 5 or 95 used as coordinates due to how a 10px ellipse is drawn.
ellipse should touch edge of canvas */
fill(#00ffff); // cyan
ellipse(5, 5, 10, 10); 

fill(#ffff00); // yellow
ellipse(5, 95, 10, 10);

fill(#ff00ff); // magenta
ellipse(95, 5, 10, 10);

fill(#000000); // black
ellipse(95, 95, 10, 10);


