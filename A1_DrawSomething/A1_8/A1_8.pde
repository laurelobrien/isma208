/*
A1_8
Laurel O'Brien
laureljobrien@gmail.com
Finished 09/18/15
Draw a line with ellipses at either end.
*/

// two 10px diameter ellipses horizontally aligned at 50px
ellipse(20, 50, 10, 10);
ellipse(80, 50, 10, 10);

// draw line horizontally aligned with ellipses and 10px shorter 
// (2 10px-ellipse radii) than the space between ellipses'
// centerpoints
line(25, 50, 75, 50);
