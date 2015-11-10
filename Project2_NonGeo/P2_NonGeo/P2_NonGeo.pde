/* Project 2: Condensate
   Option 2: Exploration of non-geometric aesthetics
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description]
*/

/* ! change this integer (minimum of 5 seconds) to reduce time between image transitions */
int transitionWait = 60; //seconds between image transitions

//declare and/or initialize variables
//
//PImages and PGraphics
PImage leafyPlant; //leafy plant in pitcher
PImage tallPlant; //echinacea in pot
PImage shortPlant; //aloe in pot
PImage previousPhoto; //last transition's blurPhoto
PImage sharpPhoto; //original, unblurred photo
PImage blurryPhoto; //pre-blurred version of sharpPhoto
PGraphics alphaMask; //"layer" storing greyscale drawings for an alpha .mask()
   
//brush variables
int brushSize = 10; //current brushSize
int brushSizeMin = 10; //minimum diameter of eraser applied by pressing mouse
int brushSizeMax = 40; //maximum diameter of eraser
int brushMod = 1; //amount that brushSize is changed every frame
float brushSizeOscillate; //brushSize re-mapped with sinSmooth()

//counting, timing, and opacity variables
int idleCounter; //track frames passed since mouse was last pressed
int frameMemory; //same as idleCounter but reset when transitionImage() executes
int opacCounter; //opacity of image that refogs window
int currentImage = 0; //index in images[] of current photo displayed
int initialOpac = 255; //100% opacity for starting frame
float fade = 0; //opacity used for fading in next image
float easedFade; //fade re-mapped with sinSmooth()

//booleans
boolean hasFogReturned = false; //true = refogWindow(); has returned condensation to 100% opacity
boolean hasImageChanged = true; //the new current image has finished fading in

//PImage array of photos with 22 indices
PImage[] images = new PImage[22]; 



void setup() {
  size(900, 675); //window size
  noStroke(); //remove stroke
  noFill(); //remove fill
  
  //initialize alphaMask PGraphics
  alphaMask = createGraphics(width, height);
  
  //initialize images[] with all photos
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage(i +".jpg"); //load photo into index matching its file name
   }
  
  //initialize houseplant images
  leafyPlant = loadImage("pitcherplant.png");
  tallPlant = loadImage("echinacea.png");
  shortPlant = loadImage("aloe.png");
  
  //initialize alphaMask contents
  alphaMask.beginDraw();
  alphaMask.background(255); //white: mask is full opacity
  alphaMask.endDraw();
}

//draw a sharp photo, a blurry version of it over top with an alpha mask applied,
//and ink drawings of houseplants sitting along the bottom like a windowsill.
//after an interval of inactivity, transition image with a gentle sinSmooth-applied fade
//to a new one. when image is not actively transitioning, allow pressing on the canvas
//to draw to the alpha mask and "erase" the blurry photo, fading the alpha mask back to
//100% white if user stops drawing for 5 straight seconds.
void draw() {
  //transition to next image if user has idled for >10 seconds
  if (frameMemory > frameRate * transitionWait) {
    transitionImage(); //change images[x] to next image in array
    initialOpac = 0; //after first transition this will always be 0
    fade = 0; //reset amount of fade from last transition
    hasImageChanged = true; //image has begun transitioning
  }
  
  
  if (hasImageChanged == true) {
    fade();
  }
  
  //update variables
  sharpPhoto = images[currentImage]; //update sharpPhoto's value
  blurryPhoto = images[currentImage+1]; //update blurryPhoto's value
  brushSizeOscillate = sinSmooth(brushSize, 10, 40, 10, 40); //map brushSize to sine wave
  easedFade = sinSmooth(fade, 0, 255, 0, 255);
  
  //draw previousPhoto from currentImage - 1 only if this doesn't go below 0
  if (currentImage > 0) {
    previousPhoto = images[currentImage - 1];
    image(previousPhoto, 0, 0);
  }
  
  //if next image's blurPhoto has fully faded in:
  if (hasImageChanged == false) {
    image(sharpPhoto, 0, 0); //draw PImage holding images[currentImage]
    drawToMask(); //allow user to draw to alphaMask
  }
  
  //assign alphaMask as a mask of whatever blurryPhoto holds
  blurryPhoto.mask(alphaMask);
  
  //call that image with mask now applied,
  tint(255, initialOpac+easedFade); //white tint with variable opacity
  image(blurryPhoto, 0, 0);
  noTint(); //end tint
  
  //if user has been idle for time determined in hasUserIdled():
  if (hasUserIdled() == true) {
    refogWindow(); //begin increasing opacity of white rect() in alphaMask
  }
  
  //draw houseplants on windowsill
  image(leafyPlant, 550, 275); //leafy plant
  image(tallPlant, 30, 360); //echinacea
  image(shortPlant, 250, 480); //aloe
  
  //change brushSize with change amount modulated by sinSmooth     
  changeBrushSize();
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



//draw black ellipses where user presses the mouse, and a variable-opacity
//white rectangle over top to "erase" when needed in refogWindow()
void drawToMask() {
  alphaMask.beginDraw();
  //if any mouse button is pressed:
  if (mousePressed) {
    alphaMask.fill(0); //black fill
    alphaMask.ellipse(mouseX, mouseY, brushSizeOscillate, brushSizeOscillate); //draw variable size ellipse
  }
  alphaMask.fill(255, opacCounter); //white with variable opacity
  alphaMask.rect(0, 0, width, height); //rectangle covering canvas
  alphaMask.endDraw();
}



//increase opacity of next image during transition
void fade() {
  //if opacity is less than maximum alpha value
  if (fade < 255) {
    fade ++; //increment opacity
  //else if opacity has reached its maximum and image is full transitioned
  } else if (fade >= 255) {
    hasImageChanged = false; //forget image has changed so it can reoccur
  }
}



//increase opacity of white rect() in alphaMask up to 100% opacity
void refogWindow() {
  //for every 5th frame, if opacCounter isn't at full rgba opacity:
  if ((opacCounter < 255) && (frameCount % 5 == 0)) {
    opacCounter ++; //increment opacCounter
  }
  
  //if opacCounter has reached full opacity:
  if (opacCounter == 255) {
    hasFogReturned = true; //indicate condensation has fully returned
  } else {
    hasFogReturned = false; //indicate condensation has not fully returned
  }
}



// Smoothing function that uses a sine wave, by Ben Bogart
float sinSmooth(float value, float inputMin, float inputMax, float outputMin, float outputMax) {
  
  // Convert input value (ranging from inputMin to inputMax) to pi relative values.
  float piValue = map(value, inputMin, inputMax, -HALF_PI, HALF_PI);
  
  // Calculate smoothed version using a section of a sinwave.
  return ((0.5*(sin(piValue)+1))*(outputMax-outputMin))+outputMin;
}
