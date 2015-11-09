/* 
Project 2: TBD
Option 2: Exploration of non-geometric aesthetics
Laurel O'Brien
lobrien14692@ecuad.ca

[Project Description]
*/
  
   

int brushSize = 15; //diameter of eraser applied by pressing mouse
int idleCounter; //track frames passed since mouse was last pressed
int opacCounter; //opacity of image that refogs window
int frameMemory;
int currentImage = 0; //index in images[] of current photo displayed
PImage[] images = new PImage[20]; //array of photos


void setup() {
  
  size(900, 675); //window size
  noStroke(); //remove str
  noFill(); //remove fill
  
  //initialize PGraphics
  blurMask = createGraphics(width, height);
  staticImage = createGraphics(width, height);
  alphaMask = createGraphics(width, height);
  
  //initialize images[] with all photos
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".jpg");
   }
  
  //initialize houseplant images
  leafyPlant = loadImage("leafy_plant-01.png");
  spikyPlant = loadImage("spiky_plant-01.png");
  
  //set up initial PGraphics contents
  staticImage.beginDraw();
  staticImage.image(images[currentImage], 0, 0); //draw karori photo at window origin
  staticImage.endDraw();
  
  blurMask.beginDraw();
  blurMask.image(images[currentImage + 1], 0, 0); //draw blurred karori photo at window origin
  blurMask.endDraw();
  
  alphaMask.beginDraw();
  alphaMask.background(255);
  alphaMask.endDraw();
}


void draw() {
  /*if user is currently idle:
  if (hasUserIdled() == true) {
    //transition to next image if 10 seconds have passed 
    //since last transition
    transitionImage(); 
  }*/
  
  //draw photos
  image(staticImage, 0, 0); //draw PGraphics holding karori
  
  alphaMask.beginDraw();
  if (mousePressed) {
    alphaMask.fill(0); //black
    alphaMask.ellipse(mouseX, mouseY, brushSize, brushSize);
  }
  alphaMask.endDraw();
  
  //assign alphaMask as a mask of whatever images[currentImage+1] is
  images[currentImage+1].mask(alphaMask);
  
  //call that image (with mask now applied)
  image(images[currentImage+1], 0, 0);
  
  /*if (hasUserIdled() == true) {
    refogWindow(); //draw kaoriBlurred with increasing opacity
    frameMemory ++; //increase count of idle frames for transitioning images
  }
  
  //draw houseplants on windowsill
  image(leafyPlant, 30, 437); //laurels
  image(spikyPlant, 700, 508); //aloe
       
  //every 7 frames:
  if (frameCount % 7 == 0) {
    brushSize ++; //increment brushSize
  }*/
}



//check if 5 seconds have passed since user drew anything
//if so, return true
boolean hasUserIdled() {
  //if user is not pressing a mouse button:
  if (mousePressed == false) {
    idleCounter ++; //increment count of idle frames
  //if user IS pressing a mouse button
  } else if (mousePressed == true) {
    idleCounter = 0; //reset idle counter: user is drawing
    opacCounter = 0; //reset opacity of "re-fogging" image in refogWindow()
  }
  
  //check if 5 seconds of idling have elapsed
  if (idleCounter > frameRate * 5) {
    return true; //5 straight seconds of no mouse pressing
  } else {
    return false; //mouse was pressed in the last 5 seconds
  }
}



//transition image if user is idle for 10 seconds
void transitionImage() {
  if (frameMemory >= frameRate * 10) {
    currentImage += 2; //increment index used to draw image(images[])
    
    //re-assign staticImage's contents
    staticImage.beginDraw();
    staticImage.image(images[currentImage], 0, 0);
    staticImage.endDraw();
    
    //re-assign blurMask's contents
    blurMask.beginDraw();
    blurMask.image(images[currentImage+1], 0, 0);
    blurMask.endDraw();
    
    frameMemory = 0; //reset memory of last transition
  }
}



// Smoothing function that uses a sinewave, by Ben Bogart
float sinSmooth(float value, float inputMin, float inputMax, float outputMin, float outputMax) {
  
  // Convert input value (ranging from inputMin to inputMax) to pi relative values.
  float piValue = map(value, inputMin, inputMax, -HALF_PI, HALF_PI);
  
  // Calculate smoothed version using a section of a sinwave.
  return ((0.5*(sin(piValue)+1))*(outputMax-outputMin))+outputMin;
}