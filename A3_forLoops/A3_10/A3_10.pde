/*
A3_10
Laurel O'Brien
laureljobrien@gmail.com
10/11/15
Create a motion graphic using cos and/or sin.
*/

//starsMatter() copied from A3_8

//declare and initialize
float xAxis; //x position that shifts according to sine wave
float trackLength; //length of path xAxis can follow
float angle = 0; //modify sin() argument; the speed xAxis shifts along trackLength
int[] starChart = new int[99]; //100 empty indices


void setup()
{
  trackLength = width - 40; //40px buffer from center of white ball
  
  //for every index in starChart[]:
  for (int stars = 0; stars < starChart.length; stars ++) {
    starChart[stars] = int(random(0, 99)); //select it and assign random value
  }
}


//draw a white ball rolling back and forth in the desert at dusk, whose
//cast shadow changes with its perceived angle between the viewer and the sun.
void draw() 
{
  drawBackground(); //call function that draws a desert background
  
  float xAxis = 20 + (sin(angle + PI/2) * trackLength/2) + trackLength/2; //left and right drifting x position
  
  ellipseMode(CORNER); //draw ellipse from its upper left corner
  fill(0, 0, 0, 50); //low opacity black
  //ellipse shortens and widens with a smaller version of the sine wave that moves its x position
  ellipse(xAxis - 10 + (xAxis*0.05), (height/1.5) + 7, 15 + (xAxis * 0.3), 32 - (xAxis * 0.3)); //shadow under ball
  
  ellipseMode(CENTER); //draw ellipse from its center
  fill(255); //white
  ellipse(xAxis, height/1.5, 20, 20); //white ball
  
  angle += 0.02; //increment sin() angle
}


//draw a sun setting over the desert
void drawBackground() 
{
  noStroke();
  
  //draw overlapping rectangles gradiating from yellow to night-sky purple
  background(#ffe27b); //yellow
  fill(#ffbd57); //pale orange
  rect(0, 0, width, height-height/2.5); 
  fill(#ff8768); //peach
  rect(0, 0, width, height-height/1.9);
  fill(#ff6053); //cinnamon
  rect(0, 0, width, height-height/1.5);
  fill(#863f48); //purple
  rect(0, 0, width, height-height/1.3);
  
  starSmatter(); //call function that draws a random smattering of stars
  noStroke(); //turn off stroke from starSmatter()
  
  fill(#E85621); //blood orange
  ellipse(30, height-height/3, 30, 30); //setting sun
  
  fill(#F0D096); //yellow
  rect(0, height-height/3, width, height/3); //sand
}


//draw 100 stars with coordinates pulled from starChart[],
//with their strokeWeight() randomized every frame to create a flicker
void starSmatter() 
{
  for (int stars = 0; stars < starChart.length; stars ++) {
    stroke(255); //white
    strokeWeight(random(1, 2)); //randomize diameter of point()s
    point(starChart[stars], starChart[98 - stars]); //x axis = for-loop count, y axis is its opposite
  }
}
