/* 
Class 8
Exercise 3
Laurel O'Brien
lobrien14692@ecuad.ca

draw an image and next to it, draw a rectangle filled
with the image's average colour
*/

//declare and initialize
PImage duck;
float imgArea; //W x H

void setup() {
  noStroke(); //remove stroke
  size(1000, 546); //canvas size
  duck = loadImage("Ducky.jpg"); //initialize duck
  imgArea = duck.width * duck.height; //total pixels in image
}

//this can technically be moved to setUp since the images are static
//and the for-loop derives all necessary information in one frame
void draw() {
  //declare + initialize local variables
  int totalRed = 0;
  int totalBlue = 0;
  int totalGreen = 0;
  float avgRed;
  float avgGreen;
  float avgBlue;

  image(duck, 0, 0); //starting image
  
  duck.loadPixels(); //load duck into a pixel array
  
  //for every pixel in duck, add its rgb channel values to
  //corresponding variable
  for (int i = 0; i < imgArea; i++) {
    totalRed += red(duck.pixels[i]);
    totalGreen += green(duck.pixels[i]);
    totalBlue += blue(duck.pixels[i]);
  }
  //average the total colour value by number of pixels in duck
  avgRed = totalRed / imgArea;
  avgGreen = totalGreen / imgArea;
  avgBlue = totalBlue / imgArea;
  
  //draw a rectangle with a fill of average colour values
  fill(avgRed, avgGreen, avgBlue);
  rect(width/2, 0, 500, 564);
}
