float cyan, yellow, magenta, black; //basic CMYK printing inks
float totalInk = 100; //100 parts for one batch of ink
float currentInk = 0; //ink currently added to batch
color swatch = color(random(255),random(255),random(255));


void setup() {
  size(400, 400);
  background(255);
  colorMode(RGB, 255);
  
  mixInk();
  //println(cyan, yellow, magenta, black);
  
  
  
  
}



void draw() {
  CMYK_Colour cmyk_swatch = new CMYK_Colour(swatch); //create new instance of CMYK_Colour
  
  background(swatch); //fill background with random swatch colour
 
 //print CMYK values
  println("CYAN: " + cmyk_swatch.cyan);
  println("MAGENTA: " + cmyk_swatch.magenta);
  println("YELLOW: " + cmyk_swatch.yellow);
  println("BLACK: " + cmyk_swatch.black);
}

//choose proportions of water-based inks to mix
void mixInk() 
{
  if (currentInk < totalInk) {
    cyan = round(random(0, 100));
    currentInk += cyan;
  }
  if (currentInk < totalInk) {
    yellow = round(random(0, totalInk - currentInk));
    currentInk += yellow;
  }
  if (currentInk < totalInk) {
    magenta = round(random(0, totalInk - currentInk));
    currentInk += magenta;
  }
  if (currentInk < totalInk) {
    black = round(totalInk - currentInk);
    currentInk += black;
  }
}


void mousePressed() {
  swatch = color(random(255), random(255), random(255)); //re-assign swatch as new random colour
}
