////////////////////////
// Photos and PGraphics: declaration, functions

PImage leafyPlant; //laurels
PImage spikyPlant; //aloe
PGraphics blurMask; //"layer" storing blurred images and effects
PGraphics staticImage; //"layer" storing unblurred image


void refogWindow() {
  tint(255, 0+opacCounter);
  image(images[currentImage+1], 0, 0);
  noTint();
  
  if (opacCounter < 255) {
    opacCounter ++;
  }
  //if window fully refogs, re-assign blurMask as holding an un-erased photo
  if (opacCounter >= 255) {
    blurMask.beginDraw();
    blurMask.image(images[currentImage+1], 0, 0); //draw blurred karori photo at window origin
    blurMask.endDraw();
  }
}



//load pixels of blurMask into an array and turn pixels transparent
//if they're within (brushSize) range of mouse position.
void eraseBlurMask() {
  //map increases in brush size to a sine wave via sinSmooth
  float brushSizeJitter = sinSmooth(brushSize, 30, 10, 30, 10);
  
  color transparent = color(0, 0); //black, 0% opacity
  
  blurMask.beginDraw(); //start drawing to blurMask
  if (mousePressed) {
    blurMask.loadPixels(); //load pixels in blurMask into an array
    //for every column of pixels
    for (int x = 0; x < blurMask.width; x ++) {
      //for every row of pixels
      for (int y = 0; y < blurMask.height; y ++) {
        if (dist(x, y, mouseX, mouseY) <= brushSizeJitter) {
          int loc = x + y * blurMask.width; //translate x,y location into linear index in .pixels[]
          blurMask.pixels[loc] = transparent; //change colour of pixel at [loc] index to c
        } 
      }
    } //end of column/row for loop
    blurMask.updatePixels(); //update the state of pixels in pixel array
  }
  blurMask.endDraw(); //finished drawing to blurMask
}