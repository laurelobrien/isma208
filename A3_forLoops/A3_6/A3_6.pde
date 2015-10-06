/*
A3_6
Laurel O'Brien
laureljobrien@gmail.com
10/05/15
Use a for loop and a random number generator to draw 100 shapes.
*/

//declare and initialize 
int i;
int diameter = i + 5;
int radius = diameter / 2;

void setup() 
{
  noStroke(); //remove stroke
  background(#333333); //dark grey
}

void draw() 
{
  //declare and initialize local variables
  float ranRed = random(0, 255);
  float ranGreen = random(0, 255);
  float ranBlue = random(0, 255);
  
  //repeat for 100 iterations and then stop
  for (int i = 0; i < 100; i++) {
    fill(ranRed, ranGreen, ranBlue);
    ellipse(random(0 + radius, height - radius), random(0 + radius, height - radius), diameter, diameter);
  }
  
  println(i);
}