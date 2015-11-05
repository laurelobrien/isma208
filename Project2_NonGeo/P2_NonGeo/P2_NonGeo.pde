/* Project 2: [title of your project]
   Option 2: Exploration of non-geometric aesthetics
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
PImage karori; //unblurred image behind window
PImage karoriBlurred; //blurred image on surface on window
PGraphics blurMask; //"layer" storing blurred images and effects
PGraphics staticImage; //"layer" storing unblurred image
int brushSize = 20; //diameter of eraser applied by pressing mouse


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
  
  //set up initial PGraphics contents
  staticImage.beginDraw();
  staticImage.image(karori, 0, 0); //draw karori photo at window origin
  staticImage.endDraw();
  
  blurMask.beginDraw();
  blurMask.image(karoriBlurred, 0, 0); //draw blurred karori photo at window origin
  blurMask.endDraw();
}


void draw() {
  image(staticImage, 0, 0); //call PGraphics holding karori
  
  /* !! comment out all but 1 to see effects !! */
  //eraseBlurMask(); //erase where mouse pressed, cover with blurred image over time
  //eraseBlurMaskRed(); //erase where mouse pressed, cover with red over time
  eraseBlurMaskPlain(); //no covering, just erase where mouse pressed
  /* !!                                      !! */
  
  image(blurMask, 0, 0); //call PGraphics holding everything drawn to blurMask
}



//load pixels of blurMask into an array and turn pixels transparent
//if they're within (brushSize) range of mouse position.
void eraseBlurMask() {
  color transparent = color(0, 0); //black, 0% opacity
  
  blurMask.beginDraw(); //start drawing to blurMask
  
  //draw copy of blurred photo that will replace "fog" gradually where
  //if (mousePressed) below will remove it
  blurMask.tint(255, 5); //white, low opacity tint
  blurMask.image(karoriBlurred, 0, 0); //blurred image stacking opacity
  blurMask.noTint(); //end tint
  
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

void eraseBlurMaskRed() {
  color transparent = color(0, 0); //black, 0% opacity
  
  blurMask.beginDraw(); //start drawing to blurMask
  
  //draw copy of blurred photo that will replace "fog" gradually where
  //if (mousePressed) below will remove it
  blurMask.fill(255, 0, 0, 5); //red, low opacity
  blurMask.rect(0, 0, width, height); //rectangle filling canvas
  blurMask.noFill(); //end fill
  
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



void eraseBlurMaskPlain() {
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