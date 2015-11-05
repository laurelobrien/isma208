///////////////////////
// transition between 2 images after 3 seconds

PImage one, two;
float fade;
boolean isImageTransitioned;
int frameMemory;

void setup() {
size(900, 675, P3D);

one = loadImage("pacificstreet.jpg");
two = loadImage("waihekeIsland.jpg");
}

void draw() {
  background(one);
  tint(255, 255, 255, 255-fade);
  image(two, 0, 0);
  
  //if 3 seconds have passed since last transition:
  if (frameMemory > frameRate * 3) {
    //increase fade up to max opacity
    if (fade < 255) {
      fade ++;
    }
    //indicate image has fully transitioned
    if (fade >= 255) {
      isImageTransitioned = true;
    }
    //reset frameMemory for next transition
    if (isImageTransitioned == true) {
      frameMemory = 0;
    }
  }
  
  frameMemory ++;
}