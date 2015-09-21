/*
A1_10
Laurel O'Brien
laureljobrien@gmail.com
Finished 09/18/15
Make a drawing of anything.
*/

/* Draw a 3-scoop neopolitan ice cream cone with cherry on top,
on a blue polka-dot background */

//blue background with polka-dot pattern
noStroke(); //remove stroke
fill(#A7CEDB); //baby blue
rect (0, 0, 100, 100); //background: fills 100x100 canvas
fill(#BFD6DE); //lighter blue dots
//row 1: start at 10x10 and advance horizontally 20px
ellipse(10, 10, 5, 5);
ellipse(10+20, 10, 5, 5);
ellipse(10+40, 10, 5, 5);
ellipse(10+60, 10, 5, 5);
ellipse(10+80, 10, 5, 5);

//row 2: start 7px left of row 1 and 15px down, continue to advance horizontally 20px
ellipse(3, 25, 5, 5);
ellipse(3+20, 25, 5, 5);
ellipse(3+40, 25, 5, 5);
ellipse(3+60, 25, 5, 5);
ellipse(3+80, 25, 5, 5);

//row 3: return to row 1's horizontal alignment but 15px down from row 2
ellipse(10, 40, 5, 5);
ellipse(10+20, 40, 5, 5);
ellipse(10+40, 40, 5, 5);
ellipse(10+60, 40, 5, 5);
ellipse(10+80, 40, 5, 5);

//row 4: return to row 2's horizontal alignment but 15px down from row 3
ellipse(3, 55, 5, 5);
ellipse(3+20, 55, 5, 5);
ellipse(3+40, 55, 5, 5);
ellipse(3+60, 55, 5, 5);
ellipse(3+80, 55, 5, 5);

//row 5: continue pattern
ellipse(10, 70, 5, 5);
ellipse(10+20, 70, 5, 5);
ellipse(10+40, 70, 5, 5);
ellipse(10+60, 70, 5, 5);
ellipse(10+80, 70, 5, 5);

//row 6: continue pattern
ellipse(3, 85, 5, 5);
ellipse(3+20, 85, 5, 5);
ellipse(3+40, 85, 5, 5);
ellipse(3+60, 85, 5, 5);
ellipse(3+80, 85, 5, 5);

//row 7: continue pattern, half of ellipses outside canvas so pattern appears to "run off" the canvas
ellipse(10, 100, 5, 5);
ellipse(10+20, 100, 5, 5);
ellipse(10+40, 100, 5, 5);
ellipse(10+60, 100, 5, 5);
ellipse(10+80, 100, 5, 5);

//set line art style
stroke(#382203); //dark brown outline
strokeWeight(2); //cartoony thick outline

//waffle cone: tall, acute triangle centered vertically
fill(#E3C57F); //light brown
triangle(50, 90, 41, 60, 59, 60);

//three 20x20px ellipses aligned vertically and spaced upwards by their radii value (10px)
fill(#B37537); //chocolate brown
ellipse(50, 60, 20, 20);
fill(#F5F0DC); //vanilla off-white
ellipse(50, 50, 20, 20);
fill(#F59A8C); //strawberry pink
ellipse(50, 40, 20, 20);

//draw cherry offset to the right of top scoop, with curved cherry stem 
fill(#ff0000); //cherry-red
ellipse(55, 32, 8, 8);
noFill(); //remove fill: stem is made entirely of a stroke
arc(62, 28, 10, 6, -PI, -PI / 2.0); //cherry stem: upper-left quarter segment of a 10x6 ellipse
