// Game of Life class

class GOL {

  //attributes
  int w = 10; //square cell dimension
  int columns, rows; //columns and rows in grid
  int[][] board; //2d array representing "game board"
  
  //constructor
  GOL() {
    //initialize rows, columns, and arrays
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows]; //initialize number of indices in board[][]
    
    init(); //call init method
  }
  
  
  ///////////////////
  //methods
  
  
  
  //initialize board[][] with random cells (dead or alive; int of 0 or 1)
  void init() {
    //for all columns minus one on either end:
    for (int i = 1; i < columns-1; i ++) {
      //and for all rows minus one on either end:
      for (int j = 1; j < rows-1; j ++) {
        board[i][j] = int(random(2)); //assign i and j index random value of 0 or 1
      }
    }
  } //end of init
  
  
  
  //create a new generation by adding the value (1 or 0) of a cell in board[][]
  //to local variable "neighbours". check neighbours against a list of rules
  //to determine the cell's fate, store it in next[][], and re-assign board[][]
  //as next[][] so the process can repeat
  void generate() {
    int[][] next = new int [columns][rows];
    
    //loop through every spot in our 2d array and check spots for neighbours
    for (int x = 1; x < columns - 1; x ++) {
      for (int y = 1; y < rows-1; y ++) {
        
        //add up all the states in a 3x3 surrounding grid
        int neighbours = 0; //init local variable neighbours
        for (int i = -1; i <= 1; i ++) {
          for (int j = -1; j <= 1; j ++) {
            neighbours += board[x+i][y+j];
          }
        }
        
        //subtract current cell's state; was added in the above loop
        neighbours -= board[x][y];
        
        // rules of life
        //
        //if cell is alive and it was has less than 2  neighbours, die
        if ((board[x][y] == 1) && (neighbours < 2))  {next[x][y] = 0;}
        //if cell is alive and has greater than 3 neighbours, die
        else if ((board[x][y] == 1) && (neighbours > 3)) {next[x][y] = 0;}
        //if cell is dead and has exactly 3 neighbours, birth
        else if ((board[x][y] == 0) && (neighbours == 3)) {next[x][y] = 1;}
        //if no rules apply to this cell, leave it unchanged
        else {next[x][y] = board[x][y];}
      }
    } //end of parent for-loop
    
    //'next' is our new board
    board = next;
 
  } //end of generate
  
  
  
  //render each "cell" black or white depending on its state
  void display() {
    //for every column:
    for (int i = 0; i < columns; i ++) {
      //for every row:
      for (int j = 0; j < rows; j ++) {
        //if cell at (i, j) in board[][] was resolved to 1
        if ((board[i][j] == 1)) {
          fill(random(255), random(255), random(255)); //random colour fill
        //if it was instead resolved to 0
        } else {
          fill(240); //grey fill
        }
        
        strokeWeight(2);
        stroke(255); //white stroke
        //draw a rectangle with above fill at a coordinate location in board[i][j],
        //adjusted for dimensions of a grid cell (w)
        rect(i*w, j*w, w, w);
      }
    }
    
  } //end of display
  
}
