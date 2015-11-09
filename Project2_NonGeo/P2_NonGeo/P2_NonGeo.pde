/* 
Project 2: TBD
Option 2: Exploration of non-geometric aesthetics
Laurel O'Brien
lobrien14692@ecuad.ca

[Project Description]
*/
  
   

int brushSize = 10; //current brushSize
int brushSizeMin = 10; //minimum diameter of eraser applied by pressing mouse
int brushSizeMax = 40; //maximum diameter of eraser
int brushMod = 1; //amount that brushSize is changed every frame
int idleCounter; //track frames passed since mouse was last pressed
int frameMemory; //same as idleCounter but reset when transitionImage() executes
int opacCounter; //opacity of image that refogs window
int currentImage = 0; //index in images[] of current photo displayed
boolean hasFogReturned = false;
PImage[] images = new PImage[22]; //array of photos
float brushSizeOscillate;



void setup() {
  
  size(900, 675); //window size
  noStroke(); //remove str
  noFill(); //remove fill
  
  //initialize alphaMask PGraphics
  alphaMask = createGraphics(width, height);
  
  //initialize images[] with all photos
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".jpg");
   }
  
  //initialize houseplant images
  leafyPlant = loadImage("leafy_plant-01.png");
  spikyPlant = loadImage("spiky_plant-01.png");
  
  //initialize alphaMask contents
  alphaMask.beginDraw();
  alphaMask.background(255); //white: mask is full opacity
  alphaMask.endDraw();
}


void draw() {
  //transition to next image if user has idled for >10 seconds
  if (frameMemory > frameRate * 3) {
    transitionImage();
  }
  
  //update variables
  sharpPhoto = images[currentImage]; //update sharpPhoto's value
  blurryPhoto = images[currentImage+1]; //update blurryPhoto's value
  brushSizeOscillate = sinSmooth(brushSize, 10, 40, 10, 40); //map brushSize to sine wave
  
  image(sharpPhoto, 0, 0); //draw PImage holding images[currentImage]
  
  //draw black ellipses inside alphaMask at mouse position if pressed,
  //and always draw white rectangle with variable opacity over top
  alphaMask.beginDraw();
  if (mousePressed) {
    alphaMask.fill(0); //black
    alphaMask.ellipse(mouseX, mouseY, brushSizeOscillate, brushSizeOscillate);
  }
  alphaMask.fill(255, opacCounter); //white with variable opacity
  alphaMask.rect(0, 0, width, height); //rectangle covering canvas
  alphaMask.endDraw();
  
  //assign alphaMask as a mask of whatever blurryPhoto holds
  blurryPhoto.mask(alphaMask);
  
  //call that image with mask now applied
  image(blurryPhoto, 0, 0);
  
  //if user has been idle for 5 seconds:
  if (hasUserIdled() == true) {
    refogWindow(); //begin increasing opacity of white rect() in alphaMask
  }
  
  //draw houseplants on windowsill
  image(leafyPlant, 30, 437); //laurels
  image(spikyPlant, 700, 508); //aloe
       
  changeBrushSize();
  
  println(idleCounter / frameRate, frameMemory / frameRate);
} //end of draw()



//check if 5 seconds have passed since user drew anything
//if so, return true
boolean hasUserIdled() {
  //if user is not pressing a mouse button:
  if (mousePressed == false) {
    idleCounter ++; //increment count of idle frames
    frameMemory ++; //increment count of frames since transition
  //if user IS pressing a mouse button
  } else if (mousePressed == true) {
    idleCounter = 0; //reset idle frame counter: user is drawing
    opacCounter = 0; //reset opacity of "re-fogging" image in refogWindow()
    frameMemory = 0; //reset idle frame counter for transitioning
  }
  
  //check if 5 seconds of idling have elapsed
  if (idleCounter > frameRate * 5) {
    return true; //5 straight seconds of no mouse pressing
  } else {
    return false; //mouse was pressed in the last 5 seconds
  }
}



//transition image if user is idle for 60 seconds
void transitionImage() {
  //if next pair of image[] indices will be outside its length:
  if (currentImage + 3 > images.length) {
    currentImage = 0; //reset currentImage to beginning of images[]
  } else {
    currentImage += 2; //increment index used to draw image(images[])
  }
  frameMemory = 0; //reset memory of last transition
}



//increase and decrease brushSize between its min and max size
void changeBrushSize() {
  //every 7 frames:
  if (frameCount % 7 == 0) {
    //if brushSize reaches or exceeds its maximum:
    if (brushSize >= brushSizeMax) {
      brushMod = -1; //decrease brushSize
    //if brushSize reaches or goes lower than its minimum:
    } else if (brushSize <= brushSizeMin) {
      brushMod = 1; //increase brushSize
    }
    
    brushSize += brushMod; //change brushSize
  }
}


// Smoothing function that uses a sine wave, by Ben Bogart
float sinSmooth(float value, float inputMin, float inputMax, float outputMin, float outputMax) {
  
  // Convert input value (ranging from inputMin to inputMax) to pi relative values.
  float piValue = map(value, inputMin, inputMax, -HALF_PI, HALF_PI);
  
  // Calculate smoothed version using a section of a sinwave.
  return ((0.5*(sin(piValue)+1))*(outputMax-outputMin))+outputMin;
}
