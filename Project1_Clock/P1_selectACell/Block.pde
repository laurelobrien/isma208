class Block {
  float x, y; //coordinates
  float side; //dimensions
  int col; //fill colour

  //constructor: demonstrates how Block takes arguments
  Block(float tempX, float tempY, float tempSide, int tempCol) {
    x = tempX;
    y = tempY;
    side = tempSide;
    col = tempCol;
  }

  //draw light grey Block inside white block
  void emptyBlock() {
    fill(#ffffff);
    rect(x, y, side, side); //draw rect accepting Block arguments
    
    fill(col);
    rect (x, y, side-2, side-2); //draw same rect but grey and inset 2px 
  }

  //draw cyan Block inside white block
  void filledBlock() {
    fill(#ffffff);
    rect(x, y, side, side); //draw rect accepting Block arguments
    
    col = 100;
    fill(col);
    rect(x, y, side-2, side-2); //draw same rect but cyan and inset by 2px
  }
}
