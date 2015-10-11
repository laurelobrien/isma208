/*
Class 4, E2
laureljobrien@gmail.com
Laurel O'Brien
10/05/2015
Write a program that draws 5 points where the x position 
of those points are stored in an array.
*/

//declare and initialize
int[] drawnPoints = new int[5]; //integer array with 5 empty places

//for every place in array drawnPoints[], select an index and assign a value depedent 
//on how many iterations have occurred
for (int element = 0; element < drawnPoints.length; element++) {
  drawnPoints[element] += element * 10; //assign index in drawnPoints[] the current value of element times 10
}

//draw point whose x position is pulled from a specific index's value in drawnPoints[]
for (int loops = 0; loops < drawnPoints.length; loops++) {
  point(drawnPoints[loops], 10);
}

