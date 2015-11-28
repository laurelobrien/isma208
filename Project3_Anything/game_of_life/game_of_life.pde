// CA / Game of Life sketching
// Laurel O'Brien
// laureljobrien@gmail.com
// 20151127
//
// manually copied from The Nature of Code exercises by Daniel Shiffman
// as practice

GOL gol; //declare GOL object "gol"

void setup() {
  size(500, 500); //canvas size
  frameRate(24); //24 fps
  gol = new GOL(); //declare new GOL object
}

void draw() {
  background(255); //white bg
  
  gol.generate(); //calculate new generation of cells
  gol.display(); //render new generation on-screen
}

void mousePressed() {
  gol.init(); //start a new game of life
}
