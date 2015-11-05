///////////////////////
// transition between 2 images after 3 seconds

float fade;
boolean isImageTransitioned = false;
int frameMemory;
PImage[] images = new PImage[8];
int idleCounter;
int currentImage = 0;


void setup() {
  size(900, 675, P3D);

  //initialize imageArray
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".jpg");
   }
}

void draw() {
  //current image
  tint(255, 0+fade);
  image(images[currentImage+1], 0, 0);
  noTint();
  
  fade += 0.5; //increase opacity of tint()
  
  //if 3 seconds have passed since last transition
  if (frameMemory > frameRate * 3) {
    //image to fade over top
    currentImage += 2; //increase index of drawn image
    fade = 0; //reset fade
    frameMemory = 0; //reset memory of last transition
  }
  
  //if the next image's index exceeds images[], restart at [0]
  if ((currentImage + 3) > images.length) {
    currentImage = 0;
  }
  
  frameMemory ++; //increment count of frames since last transition
}