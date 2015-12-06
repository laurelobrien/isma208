////////////////////////
//
// TypoAutomata class
// basic copy of Wolfram's CA as an entire object
// https://processing.org/examples/wolfram.html
//
// to do: better variable names

class TypoAutomata {

  //////////////////////
  //attributes
   
  WoodBlock[][] currentGen;
  boolean[] xRules, yRules; //store the rule sets provided in constructor
  int generation; //count generations that have transpired
  int fontSize = 24; //pt size of PFont
  int emSize = int(fontSize * 1.4); //height and width of text() letters incl. padding
  
  //columns and rows of type, letter at each intersection/"cell"
  int columns = int(width/emSize)-2;
  int rows = int(height/emSize)-2;
  
  String typeBlock; //final String used to draw letters on canvas
  float x, y; //coordinate positions for drawing grid of letters
  PFont circleTTF; //sans and serif monospace typefaces for simulating output

  //////////////////////
  //constructor
  TypoAutomata(boolean[] x, boolean[] y) {
    xRules = x;
    yRules = y;
    //emSize = 24; //set font size
    
    //create indices in currentGen that fit in canvas when drawn as text()
    currentGen = new WoodBlock[columns][rows];
    
    //fonts
    circleTTF = createFont("AcneStudiosCircleBold.ttf", fontSize); //bold Circle font
    
    //initialize currentGen[] with a seed array and generation as 0
    init();
  }
  
  //////////////////////
  //methods
  
  
  //initialize as generation 0 with random WoodBlock objects
  void init() {
    //for each column (x-axis)
    for (int i = 0; i < columns; i ++) {
      //for each row (y-axis)
      for (int j = 0; j < rows; j ++) {
        //select the intersection in currentGen[][]
        //and assign as random WoodBlock object, 
        //minus the full-stop in the last index
        currentGen[i][j] = allBlocks[int(random(allBlocks.length))]; 
      }
    }
    
    generation = 0; //(re)set generation counter
  } //end of init()
  
  
  
  void generate() {
    //create an empty array for the new generation, same size as currentGen[][]
    WoodBlock[][] nextGen = new WoodBlock[columns][rows];
    
    //for every WoodBlock object in a 2D array (except the ones on the edges
    //without a full neighbourhood)
    for (int i = 1; i < columns-1; i ++) {
      for (int j = 1; j < rows-1; j ++) {
        WoodBlock me = currentGen[i][j]; //WoodBlock to evaluate
        
        //establish x-axis neighbourhood; left and right
        WoodBlock left = currentGen[i-1][j];
        WoodBlock right = currentGen[i+1][j];
        
        //establish y-axis neighbourhood; above and below
        WoodBlock above = currentGen[i][j-1];
        WoodBlock below = currentGen[i][j+1];
        
        //compute next generation based on rule set
        nextGen[i][j] = applyRules(me, left, right, above, below);
      }
      
    }
    
    //copy this new generation into the current one, overwriting it.
    //ignore edge WoodBlocks that have gone unchanged
    //(maybe begin changing the edges based only on above/below neighbours?)
    for (int i = 1; i < columns-1; i ++) {
      for (int j = 1; j < rows-1; j ++) {
        currentGen[i][j] = nextGen[i][j];
      }
    }
    
    generation ++; //increment generation counter
  } //end of generate()
  
  
  
  //draw a simulation of the print on the canvas
  void render() {
    //for every WoodBlock in currentGen[][], determine what its 
    //String output will look like
    for (int i = 0; i < columns; i ++) {
      for (int j = 0; j < rows; j ++) {
        if (wantColour) {
          if (currentGen[i][j].hasAscender) {
            fill(#1500a2); //dark blue ascenders
          } else if (currentGen[i][j].hasDescender) {
            fill(#12deef); //light blue descenders
          } else {
            fill(#f8d022); //yellow everything-else
          }
        } else {
          fill(0); //don't want colour: black
        }
        
        //assign object's .letter String for text() use
        typeBlock = currentGen[i][j].letter;
        
        //draw the typeBlock on canvas in a grid position, where 
        //emSize spaces out columns and generation spaces out rows
        textFont(circleTTF); //set font to Circle
        textAlign(CENTER); //center-align text at coordinate position
        text(typeBlock, (i+1) * emSize, (j+1) * emSize, emSize-7, emSize); //draw 
      }
    }
  } //end of render()
  
  
  //match state of "me" and the objects around it to a prescribed 
  //WoodBlock outcome, rules[x], and return that outcome
  WoodBlock applyRules(WoodBlock me, WoodBlock left, 
                       WoodBlock right, WoodBlock above, WoodBlock below) {
    //local array list to store possible matches for the rules
    ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
    
    WoodBlock selectedType; //final outcome that function will return
    
    boolean xReq = false; //stores result of x axis rule-check
    boolean yReq = false; //stores result of y axis rule-check
    
    if (left.isVowel && me.isVowel && right.isVowel) xReq = xRules[0]; //aaa
    if (!left.isVowel && me.isVowel && right.isVowel) xReq = xRules[1]; //baa
    if (!left.isVowel && !me.isVowel && right.isVowel) xReq = xRules[2]; //bba
    if (!left.isVowel && !me.isVowel && !right.isVowel) xReq = xRules[3]; //bbb
    if (left.isVowel && !me.isVowel && !right.isVowel) xReq = xRules[4]; //abb
    if (left.isVowel && me.isVowel && !right.isVowel) xReq = xRules[5]; //aab
    if (left.isVowel && !me.isVowel && right.isVowel) xReq = xRules[6]; //aba
    if (!left.isVowel && me.isVowel && !right.isVowel) xReq =  xRules[7]; //bab
                                           
    if (!above.hasAscender && !me.hasAscender && !below.hasAscender) yReq = yRules[0];
    if (!above.hasAscender && !me.hasAscender && below.hasAscender) yReq = yRules[1];
    if (!above.hasAscender && me.hasAscender && !below.hasAscender) yReq = yRules[2];
    if (!above.hasAscender && me.hasAscender && below.hasAscender) yReq = yRules[3];
    if (above.hasAscender && !me.hasAscender && !below.hasAscender) yReq = yRules[4];
    if (above.hasAscender && !me.hasAscender && below.hasAscender) yReq = yRules[5];
    if (above.hasAscender && me.hasAscender && !below.hasAscender) yReq = yRules[6];
    if (above.hasAscender && me.hasAscender && below.hasAscender) yReq = yRules[7];
    
    
    
    //for all WoodBlocks
    for (int i = 0; i < allBlocks.length; i ++) {
      //if the WoodBlock matches the rules for its ascender and vowel status 
      if (allBlocks[i].isVowel == xReq && allBlocks[i].hasAscender == yReq) {
        //add it to the pool of possible matches
        possMatches.add(allBlocks[i]);
      }
    }
    
    //if there is anything in possMatches
    if (possMatches.size() > 0) {
      //select one if its contents at random and return it
      selectedType = possMatches.get(int(random(possMatches.size())));
      return selectedType; 
    //if possMatches is empty, no letters qualified.
    //instead search exclusively for letters with descenders
    } else {
      for (int i = 0; i < allBlocks.length; i ++) {
        if (allBlocks[i].hasDescender) {
          possMatches.add(allBlocks[i]);
        }
      }
      selectedType = possMatches.get(int(random(possMatches.size())));
      return selectedType; 
    } 
    
    
    //default return should none apply
    //return allBlocks[0];
  } //end of applyRules
  
  
  
  //is the CA grid finished filling out the canvas?
  boolean finished() {
    //if another row (generation) the size of emSize won't fit on the canvas:
    if (generation > height/emSize) {
      return true;
    } else {
      return false;
    }
  } //end of finished()
  
  
} //end of WoodBlock class definition
