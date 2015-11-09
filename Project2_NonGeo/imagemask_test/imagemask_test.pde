PImage photo, blurPhoto;
PGraphics alphaLayer;
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(900, 675);
  photo = loadImage("0.jpg");
  blurPhoto = loadImage("1.jpg");
  
  alphaLayer = createGraphics(width, height);
  
  //initialize alphaLayer background
  alphaLayer.beginDraw();
  alphaLayer.background(255); //white: full opacity of mask subject
  alphaLayer.endDraw();
}

void draw() {
  image(photo, 0, 0); //draw photo: erase last frame
  int which = frameCount % num; //current frameCount, wrapping at num
  
  //draw low opacity black ellipses to alphaLayer where mouse is pressed.
  //they will stack opacity continuously, making the ellipse appear to "fade in"
  alphaLayer.beginDraw();
  //if mouse is pressed:
  if (mousePressed) {
    mx[which] = mouseX; //value of mouseX and mouseY assigned to index at frameCount's value
    my[which] = mouseY;
    //store mouse 60 most recent positions in an array
    for (int i = 0; i < num; i++) {
      //which + 1 is the smallest (the oldest in the array)
      int index = (which + 1 + i) % num;
      alphaLayer.fill(0, 1); //low opacity black
      alphaLayer.ellipse(mx[index], my[index], 30, 30); //ellipse drawn at stored x,y position
    }
  }
  alphaLayer.endDraw();
  
  //apply alphaLayer as a mask of blurPhoto
  blurPhoto.mask(alphaLayer);
  
  //draw photo and blurPhoto
  image(photo, 0, 0);
  image(blurPhoto, 0, 0);
}
