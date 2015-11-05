/* 
Project 2: TBD
Option 2: Exploration of non-geometric aesthetics
Laurel O'Brien
lobrien14692@ecuad.ca

There are 3 functions in draw() that all do almost the same thing:
eraseBlurMask(): turn blurred photo transparent where mouse is pressed,
  draw another copy of blurred photo on top to create illusion of window
  re-condensating
eraseBlurMaskRed: do the same thing but covering the canvas with a red rectangle
  instead of a copy of the blurred photo
eraseBlurMaskPlain: do the same thing but without anything covering the canvas
  over the erasure of the blurred photo
*/
  
   

int brushSize = 15; //diameter of eraser applied by pressing mouse
boolean isUserIdle = false;
int idleCounter; //track frames passed since mouse was last pressed
int opacCounter;
float brushSizeJitter = sinSmooth(brushSize, 20, 10, 20, 10);
int frameMemory;



void setup() {
  size(900, 675); //window size
  noStroke(); //remove stroke
  noFill(); //remove fill
  
  //initialize PGraphics
  blurMask = createGraphics(width, height);
  staticImage = createGraphics(width, height);
  
  //initialize PImages
  karori = loadImage("karori.jpg"); //karori neighborhood in wellington, new zealand
  karoriBlurred = loadImage("karori_blur.jpg"); //" " blurred
  karoriBlurredPlain = loadImage("karori_blur.jpg"); //" " blurred
  pacificStreet = loadImage("pacificstreet.jpg"); //1080 pacific street
  pacificStreetBlurred = loadImage("pacificstreet_blur.jpg");
  
  leafyPlant = loadImage("leafy_plant-01.png");
  spikyPlant = loadImage("spiky_plant-01.png");
  
  //set up initial PGraphics contents
  staticImage.beginDraw();
  staticImage.image(pacificStreet, 0, 0); //draw karori photo at window origin
  staticImage.endDraw();
  
  blurMask.beginDraw();
  blurMask.image(pacificStreetBlurred, 0, 0); //draw blurred karori photo at window origin
  blurMask.endDraw();
}


void draw() {
  //draw photos
  image(staticImage, 0, 0); //draw PGraphics holding karori
  eraseBlurMask(); //erases blurMask where mouse is pressed
  image(blurMask, 0, 0); //draw PGraphics holding everything drawn to blurMask
  
  if (hasUserIdled() == true) {
    refogWindow(); //draw kaoriBlurred with increasing opacity
  }
  
  //draw houseplants on windowsill
  image(leafyPlant, 30, 437); //laurels
  image(spikyPlant, 700, 508); //aloe
  
  //map increases in brush size to a sine wave via sinSmooth
  brushSizeJitter = sinSmooth(brushSize, 30, 10, 30, 10);
  
  //draw pulsing ellipse to test sinSmooth
  fill(255);
  ellipse(width/2, height/2, brushSizeJitter, brushSizeJitter);
  noFill();
  
  //every 7 frames:
  if (frameCount % 7 == 0) {
    brushSize ++; //increment brushSize
  }
}



//check if 5 seconds have passed since user drew anything
boolean hasUserIdled() {
  //begin counting frames of idling when user isn't drawing
  if (mousePressed == false) {
    idleCounter ++;
  } else if (mousePressed == true) {
    idleCounter = 0;
    opacCounter = 0;
  }
  
  //check if 5 seconds of idling have elapsed
  if (idleCounter > frameRate * 5) {
    return true;
  } else {
    return false;
  }
}



// Smoothing function that uses a sinewave.
float sinSmooth(float value, float inputMin, float inputMax, float outputMin, float outputMax) {
  
  // Convert input value (ranging from inputMin to inputMax) to pi relative values.
  float piValue = map(value, inputMin, inputMax, -HALF_PI, HALF_PI);
  
  // Calculate smoothed version using a section of a sinwave.
  return ((0.5*(sin(piValue)+1))*(outputMax-outputMin))+outputMin;
}