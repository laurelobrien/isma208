////////////////////////
// Photos and PGraphics: declaration, functions

PImage leafyPlant; //laurels
PImage spikyPlant; //aloe
PImage previousPhoto; //last transition's blurPhoto
PImage sharpPhoto; //original, unblurred photo
PImage blurryPhoto; //pre-blurred version of sharpPhoto
PGraphics alphaMask; //"layer" storing greyscale drawings for an alpha .mask()


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
