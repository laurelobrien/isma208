/* Project 2: [title of your project]
   Option 2: Exploration of non-geometric aesthetics
   Laurel O'Brien
   lobrien14692@ecuad.ca

   [Project Description (approximately 300 words)] */
   
PImage karori;
PImage karoriBlurred;
PImage karoriBlurredPlain;
int opacCounter = 0;

int num = 120;
float mx[] = new float[num];
float my[] = new float[num];

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
  noTint();*/
  
} //end of draw()



void mousePressed() {
  if (mouseButton == LEFT) {
    eraseBlurMask();
    
    // Cycle through the array, using a different entry on each frame. 
    // Using modulo (%) like this is faster than moving all the values over.
    int which = frameCount % num;
    mx[which] = mouseX;
    my[which] = mouseY;
    
    for (int i = 0; i < num; i++) {
      // which+1 is the smallest (the oldest in the array)
      int index = (which + 1 + i) % num;
      //redrawBlurMask(mx[index], my[index]);
      tint(255, 5);
      redrawBlurMask(mx[index], my[index]);
      noTint();
      
      println(mx[index], my[index]);
    }
  }
}


//store last 60 mouse positions in an array
void delayTrail() {
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  while (mousePressed) {
    mx[which] = mouseX;
    my[which] = mouseY;
  }
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which + 1 + i) % num;
    //redrawBlurMask(mx[index], my[index]);
    fill(255, 0, 0, 255);
    ellipse(mx[index], my[index], 20, 20);
    noFill();
    println(mx[index], my[index]);
  }
} //end of delayTrail();

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



void redrawBlurMask(float inputX, float inputY) 
{
  karoriBlurred.loadPixels();
  karoriBlurredPlain.loadPixels();
  //for every column of pixels
  for (int x = 0; x < karoriBlurred.width; x ++) {
    //for every row of pixels
    for (int y = 0; y < karoriBlurred.height; y ++) {
        if (dist(x, y, inputX, inputY) <= 20) {
        //translate x,y location into linear index in .pixels[]
        int loc = x + y * karoriBlurred.width;
        //change [loc] to unaltered state of karoriBlurredPlain
        karoriBlurred.pixels[loc] = karoriBlurredPlain.pixels[loc]; 
      } 
    }
  } //end of grid for-loop
  karoriBlurred.updatePixels(); //update the state of pixels in pixel array
}