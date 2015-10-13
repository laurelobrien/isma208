/*
A3_8
Laurel O'Brien
laureljobrien@gmail.com
10/11/15
Use the angle of the smaller circle to the middle of the canvas 
to smoothly change the colour of the smaller circle. 
i.e. map the angle to the colour value in some way.
*/

/*
Code copied from A3_7 to draw the large circle
with a small circle orbiting its circumference
*/

//declare and initialize
float orbitPath; //diameter of orbit path and large circle
float angle = 0; //modify sin() and cos() arguments
int[] starChart = new int[99]; //100 empty indices for star coordinates

void setup() { 
  orbitPath = height - 20; //20px buffer from edge of canvas
  
  //create static array of 100 numbers between 0 and 99 inclusive
  for (int stars = 0; stars < starChart.length; stars ++) {
    starChart[stars] = int(random(0, 99)); //select index corresponding to iteration count, store random number in it
  }
}

//draw a planet (small circle) orbiting a sun on a visible path (large circle) 
//with twinkling stars. every time the program is run, the stars are in a different layout.
void draw() {
  background(0); //black: erase last frame
  
  starSmatter(); //call function that draws and pulsates stars
  
  stroke(255); //white 1px stroke
  strokeWeight(1); //reset changes from starSmatter()
  noFill(); //no fill
  ellipse(width/2, height/2, orbitPath, orbitPath); //draw large circle

  noStroke(); //remove stroke
  
  //use sine and cosine to modulate x and y axes forward and back, up and down, simultaneously.
  //(* orbitPath/2) scales sin() result to a visible increase by its intended path radius and
  //(+ orbitPath/2) indicates the radius of the path itself
  float xAxis = 10 + (sin(angle + PI/2) * orbitPath/2) + orbitPath/2;
  float yAxis = 10 + (cos(angle + PI/2) * orbitPath/2) + orbitPath/2;
  
  fill(255, 210, 0); //yellow
  ellipse(width/2, height/2, 30, 30); //sun
  
  fill(20 + (xAxis * 2), 200, 255 - (yAxis * 2)); //light blue, with colour changed modulated by x and y movement
  ellipse(xAxis, yAxis, 15, 15); //small circle
  
  angle += 0.02; //increment sin/cos argument 
}

//a smattering of 100 point() stars.
//strokeWeight() is randomized continuously to make stars pulse
//point() coordinates are randomized once in setup() so they stay in place
void starSmatter() 
{
  for (int stars = 0; stars < 99; stars ++) {
    stroke(255); //white
    strokeWeight(random(0, 3)); //randomize diameter of point()s
    point(starChart[stars], starChart[98 - stars]);
  }
}
