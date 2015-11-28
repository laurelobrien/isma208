//declare and initialize variables
Block[][] grid;

float diameter = 15; //diameter of second and minute blocks

int columns; //columns in a gridded container
int rows; //rows in a gridded container

void setup() {
  size(400, 400); //canvas size
  noStroke(); //remove stroke
  
  //6x10 unit container; 60 seconds per minute
  columns = 6;
  rows = 10;
  
  grid = new Block[columns][rows]; //array dimensions
  
  //loop through columns and rows
  for (int i = 0; i < columns; i ++) {
    for (int j = 0; j < rows; j ++) {
      //initiate objects inside the array:
      //instance of Block with x,y coordinates that form a grid, light grey colour
      grid[i][j] = new Block(i*diameter, j*diameter, diameter, 210);
    }
  }
}

void draw() {
  background(255); //white: erase last frame
  
  //draw empty grid of grey Blocks
  for (int i = 0; i < columns; i ++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].emptyBlock();
    }
  }
  
  //functional: call fill() on 60th Block
  grid[5][9].filledBlock();
  
  /*non-functional: call fill() on (second())th block
  for (int i = 0; i < second(); i ++) {
    for (int j = 0; j < rows; j ++) {
      grid[second() % columns][j].filledBlock();
    }
  } */
}
