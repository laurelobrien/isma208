import processing.pdf.*;
float cyan, yellow, magenta, black; //basic CMYK printing inks
float totalInk = 100; //100 parts for one batch of ink
float currentInk = 0; //ink currently added to batch



//declare and initialize global variables

void setup() {
  size(400, 400, PDF, "filename.pdf"); //pdf output size and name
  
  mixInk();
}

void draw() {
  // Draw something good here
  line(0, 0, width/2, height);

  // Exit the program 
  println("Drawn and saved");
  exit(); //save and exit PDF file
}


//choose proportions of water-based inks to mix
void mixInk() 
{
  if (currentInk < totalInk) {
    cyan = random(0, 100);
    currentInk += cyan;
  }
  if (currentInk < totalInk) {
    yellow = random(0, totalInk - currentInk);
    currentInk += yellow;
  }
  if (currentInk < totalInk) {
    magenta = random(0, totalInk - currentInk);
    currentInk += magenta;
  }
  if (currentInk < totalInk) {
    black = totalInk - currentInk;
    currentInk += black;
  }
}
