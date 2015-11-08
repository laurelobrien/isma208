PImage photo, blurPhoto;
PGraphics alphaLayer;

void setup() {
  size(900, 675);
  photo = loadImage("0.jpg");
  blurPhoto = loadImage("1.jpg");
  
  alphaLayer = createGraphics(width, height);
  
  alphaLayer.beginDraw();
  fill(128); //medium grey
  rect(0, 0, width/2, height/2); //rectangle filling canvas
  noFill();
  alphaLayer.endDraw();
  blurPhoto.mask(alphaLayer);
}

void draw() {
  image(photo, 0, 0);
  
  image(blurPhoto, 0, 0);
}