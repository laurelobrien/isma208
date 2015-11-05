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
  
   
   
PImage karori; //unblurred image behind window
PImage karoriBlurred; //blurred image on surface on window
PImage leafyPlant; //leafy houseplant
PImage spikyPlant;
PGraphics blurMask; //"layer" storing blurred images and effects
PGraphics staticImage; //"layer" storing unblurred image
int brushSize = 15; //diameter of eraser applied by pressing mouse



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
  leafyPlant = loadImage("leafy_plant-01.png");
  spikyPlant = loadImage("spiky_plant-01.png");
  
  //set up initial PGraphics contents
  staticImage.beginDraw();
  staticImage.image(karori, 0, 0); //draw karori photo at window origin
  staticImage.endDraw();
  
  blurMask.beginDraw();
  blurMask.image(karoriBlurred, 0, 0); //draw blurred karori photo at window origin
  blurMask.endDraw();
}


void draw() {
  image(staticImage, 0, 0); //draw PGraphics holding karori
  
  eraseBlurMask(); //erases blurMask where mouse is pressed
  
  image(blurMask, 0, 0); //draw PGraphics holding everything drawn to blurMask
  
  //draw houseplants on windowsill
  image(leafyPlant, 30, 437); //laurels
  image(spikyPlant, 700, 508); //aloe
}



//load pixels of blurMask into an array and turn pixels transparent
//if they're within (brushSize) range of mouse position.
void eraseBlurMask() {
  color transparent = color(0, 0); //black, 0% opacity
  
  blurMask.beginDraw(); //start drawing to blurMask
  if (mousePressed) {
    blurMask.loadPixels(); //load pixels in blurMask into an array
    //for every column of pixels
    for (int x = 0; x < blurMask.width; x ++) {
      //for every row of pixels
      for (int y = 0; y < blurMask.height; y ++) {
        if (dist(x, y, mouseX, mouseY) <= brushSize) {
          int loc = x + y * blurMask.width; //translate x,y location into linear index in .pixels[]
          blurMask.pixels[loc] = transparent; //change colour of pixel at [loc] index to c
        } 
      }
    } //end of column/row for loop
    blurMask.updatePixels(); //update the state of pixels in pixel array
  }
  blurMask.endDraw(); //finished drawing to blurMask
}