/* Project 2: [title of your project]
   Option 2: Exploration of non-geometric aesthetics
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
PImage karori;
PImage karoriBlurred;
PImage karoriBlurredPlain;
//int opacCounter = 0;

void setup() {
  size(900, 675); //window size
  noStroke(); //remove stroke
  
  karori = loadImage("karori.jpg"); //karori neighborhood in wellington, new zealand
  karoriBlurred = loadImage("karori_blur.jpg"); //" " blurred
  karoriBlurredPlain = loadImage("karori_blur.jpg"); //" " blurred
  
  smooth();
}

void draw() {
  image(karori, 0, 0); //draw karori photo at window origin
  image(karoriBlurred, 0, 0); //draw pre-blurred karori photo
  
  mousePressed(); //erase karoriBlurred at mouse pos while mouse is pressed
  
  /*tint(255, 1+opacCounter);
  image(karoriBlurredPlain, 0, 0);
  noTint();
  
  opacCounter ++;*/
}

void mousePressed() {
  if (mouseButton == LEFT) {
    eraseBlurMask();
  }
}



//load pixels of karoriBlurred into an array and turn pixels transparent
//if they're within brushSize range of mouse position.
void eraseBlurMask() {
  color c = color(0, 0); //black, 0% opacity
  karoriBlurred.loadPixels();
  //for every column of pixels
  for (int x = 0; x < karoriBlurred.width; x ++) {
    //for every row of pixels
    for (int y = 0; y < karoriBlurred.height; y ++) {
      if (dist(x, y, mouseX, mouseY) <= 20) {
        //translate x,y location into linear index in .pixels[]
        int loc = x + y * karoriBlurred.width;
        karoriBlurred.pixels[loc] = c; //change colour of pixel at [loc] index to c
      } 
    }
  } //end of column/row for loop
  karoriBlurred.updatePixels(); //update the state of pixels in pixel array
} //end of eraseBlurMask()


//save mouse position from last ~second
void saveMousePosition() 
{

}


//redraw pixels of karoriBlurred in their original state
void redrawBlurMask() 
{

}