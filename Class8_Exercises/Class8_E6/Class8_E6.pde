/*
Class 8
Exercise 6
Laurel O'Brien
lobrien14692@ecuad.ca

Get the average colour of every frame in the movie
! doesn't work yet !
*/

// Import video library
import processing.video.*;  

// Variable to store instance of Movie class
Movie myVideo;  

void setup() {  
  background(0);
  size(640*2,340); // Same size as video
  noStroke(); //remove stroke
  
  // Instantiate Movie object and load video file
  myVideo = new Movie(this, "transformers.mp4") ; // load Movie  

  // Play the video so that myVideo.available() is true
  myVideo.play();
  myVideo.loop();  
}  


void draw() {  
  //declare and initialize local variables
  int red = 0;
  int green = 0;
  int blue = 0;
  float avgRed = 0;
  float avgGreen = 0;
  float avgBlue = 0;
  
  //if a frame is available to be read
  if (myVideo.available()) {
    //load current frame of myVideo into a pixel array
    myVideo.loadPixels();
    
    //add up total rgb channel values of pixels in myVideo as a PImage (single frame)
    for (int i = 0; i < myVideo.pixels.length; i ++) {
      red += red(myVideo.pixels[i]);
      green += green(myVideo.pixels[i]);
      blue += blue(myVideo.pixels[i]);
    } 
    
    //average the total colour values by the number of pixels
    avgRed = red / myVideo.pixels.length;
    avgGreen = green / myVideo.pixels.length;
    avgBlue = blue / myVideo.pixels.length;
  }
  
  println(red, green, blue);
  image(myVideo, 0, 0); // display movie as image
  
  //fill rectangle with average colour of frame
  fill(avgRed, avgGreen, avgBlue);
  rect(width/2, 0, 640, 340);
}


void movieEvent(Movie myVideo) {
  myVideo.read();
}
