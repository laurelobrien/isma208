/*
A3_7
Laurel O'Brien
laureljobrien@gmail.com
10/11/15
Create an animation of a circle that moves around
the circumference of a larger circle.
*/

//declare and initialize
float orbitPath; //diameter of orbit path
float angle = 0; //modify sin() and cos() arguments

void setup() {
  orbitPath = height - 20; //20px buffer from edge of canvas
}

void draw() {
  background(0); //black: erase last frame
  
  stroke(255); //white 1px stroke
  noFill(); //no fill
  ellipse(width/2, height/2, orbitPath, orbitPath); //draw visual indicator of orbitPath

  noStroke(); //remove stroke
  
  //use sine and cosine to modulate x and y axes forward and back, up and down, simultaneously
  //(* orbitPath/2) scales it to a visible increase by its intended path radius and 
  //(+ orbitPath/2) indicates the radius of the path itself
  //add 10
  float xAxis = 10 + (sin(angle + PI/2) * orbitPath/2) + orbitPath/2;
  float yAxis = 10 + (cos(angle + PI/2) * orbitPath/2) + orbitPath/2;
  
  fill(255, 210, 0); //yellow
  ellipse(width/2, height/2, 30, 30); //larger static ellipse
  
  fill(20, 200, 255); //light blue
  ellipse(xAxis, yAxis, 15, 15); //smaller orbiting ellipse
  
  angle += 0.02; //increment sin/cos argument 
}
