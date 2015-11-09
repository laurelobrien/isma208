////////////////////////
// Photos and PGraphics: declaration, functions

PImage leafyPlant; //laurels
PImage spikyPlant; //aloe
PImage sharpPhoto; //original, unblurred photo
PImage blurryPhoto; //pre-blurred version of sharpPhoto
PGraphics blurMask; //"layer" storing blurred images and effects
PGraphics staticImage; //"layer" storing unblurred image
PGraphics alphaMask; //"layer" storing greyscale drawings for an alpha .mask()


//fade rect() alphaMask back to 100% opaque white
void refogWindow() {
  //for every 5th frame, if opacCounter isn't at full rgba opacity:
  if ((opacCounter < 255) && (frameCount % 5 == 0)) {
    opacCounter += 1; //increment opacCounter
  }
  
  //if opacCounter has reached full opacity:
  if (opacCounter >= 255) {
    hasFogReturned = true; //indicate condensation has full returned
  }
}