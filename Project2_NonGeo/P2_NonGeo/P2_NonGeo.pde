/* Project 2: [title of your project]
   Option 2: Exploration of non-geometric aesthetics
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
PImage karori;
PImage karoriBlurred;
PGraphics canvas;

void setup() {
  size(900, 675); //window size
  karori = loadImage("karori.jpg"); //karori neighborhood in wellington, new zealand
  karoriBlurred = loadImage("karori_blur.jpg"); //" " blurred
  
  smooth();
  canvas = createGraphics(width,height,JAVA2D);
  canvas.beginDraw();
  canvas.smooth();
  canvas.endDraw();
}

void draw() {
  background(255); //white: erase last frame
  noStroke(); //remove stroke

  image(karori, 0, 0); //draw karori photo at window origin
  image(karoriBlurred, 0, 0); //draw pre-blurred karori photo
  image(canvas, 0, 0); //draw canvas object from PGraphics
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    noFill(); //remove fill
    stroke(0, 255, 0); //green stroke to indicate eraser footprint
    ellipse(mouseX, mouseY, 20, 20);  //ellipse that erases where it's drawn
    eraseFunction();
  }
}

void eraseFunction() {
  color c = color(0, 0); //black, 0% opacity
  canvas.beginDraw();
  canvas.loadPixels();
  //for every column of pixels
  for (int x = 0; x < karoriBlurred.width; x ++) {
    //for every row of pixels
    for (int y = 0; y < karoriBlurred.height; y ++) {
      float distance = dist(x, y, mouseX, mouseY);
      if (distance <= 25) {
        int loc = x + y * karoriBlurred.width;
        karoriBlurred.pixels[loc] = c; //change colour of pixel at [loc] index to c
      } 
    }
  }
  karoriBlurred.updatePixels(); //update the state of pixels in pixel array
  canvas.endDraw();
}