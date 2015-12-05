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
  
  WoodBlock[] currentGen; //current generation of letters (as WoodBlocks)
  WoodBlock[] rules; //store the rule set provided in constructor
  int generation; //count generations that have transpired
  int emSize; //height and width of each character and its padding in pixels
  
  String typeBlock; //final String used to draw letters on canvas
  WoodBlock empty; //off, false, dead, opposite state of typeBlock
  float x, y; //coordinate positions for drawing grid of letters
  PFont circleTTF; //sans and serif monospace typefaces for simulating output

  //////////////////////
  //constructor
  TypoAutomata(WoodBlock[] r) {
    rules = r;
    emSize = 24; //set font size
    empty = allBlocks[0];
    
    //create indices in currentGen that fit in canvas when drawn as typeBlocks
    currentGen = new WoodBlock[width/emSize];
    
    //fonts
    circleTTF = createFont("AcneStudiosCircleBold.ttf", 18); //bold Circle font
    
    //initialize currentGen[] with a seed array and generation as 0
    restart();
  }
  
  //////////////////////
  //methods
  
  //set the rules: can change ruleset being used within same run of program
  void setRules(WoodBlock[] argRules) {
    rules = argRules;
  }
  
  
  
  //reset to generation 0
  void restart() {
    //for all indicies in currentGen[]
    for (int i = 0; i < currentGen.length; i ++) {
      currentGen[i] = allBlocks[int(random(allBlocks.length))]; //assign WoodBlock object with .letter "a"
    }
    
    generation = 0; //(re)set generation counter
  } //end of restart
  
  
  
  void generate() {
    //create an empty array for the new generation, same size as currentGen
    WoodBlock[] nextGen = new WoodBlock[currentGen.length];
    
    //for every WoodBlock object in a 1D array (except the ones on the edges
    //without a full neighbourhood)
    for (int i = 1; i < currentGen.length-1; i ++) {
      //establish neighbourhood
      WoodBlock left = currentGen[i-1];
      WoodBlock me = currentGen[i];
      WoodBlock right = currentGen[i+1];
      
      //compute next generation based on rule set
      nextGen[i] = applyRules(left, me, right);
    }
    
    //copy this new generation into the current one, overwriting it
    for (int i = 1; i < currentGen.length-1; i ++) {
      currentGen[i] = nextGen[i];
    }
    
    generation ++; //increment generation counter
  } //end of generate()
  
  
  
  //draw a simulation of the print on the canvas
  void render() {
    //for every WoodBlock in currentGen, determine what its String output will look like
    for (int i = 0; i < currentGen.length; i ++) {
      //diff colours for debugging/visualizing. 
      //can be toggled easily in global variables
      if (wantColour) {
        if (currentGen[i].hasAscender) {
          fill(#1500a2);
        } else if (currentGen[i].hasDescender) {
          fill(#12deef);
        } else {
          fill(#f8d022);
        }
      } else {
        fill(0);
      }
      
      //assign object's .letter String for text() use
      typeBlock = currentGen[i].letter;
      
      //draw the typeBlock on canvas in a grid position, where 
      //emSize spaces out columns and generation spaces out rows
      textFont(circleTTF); //set font to Circle
      textAlign(CENTER); //center-align text at coordinate position
      text(typeBlock, i * emSize, generation * emSize, emSize, emSize); //draw
    }
  } //end of render()
  
  
  
  WoodBlock applyRules(WoodBlock a, WoodBlock b, WoodBlock c) {
    //return applicable rule set if one of the following is true
    if (!a.hasAscender && !b.hasAscender && !c.hasAscender) return rules[0];
    if (!a.hasAscender && !b.hasAscender && c.hasAscender) return rules[1];
    if (!a.hasAscender && b.hasAscender && !c.hasAscender) return rules[2];
    if (!a.hasAscender && b.hasAscender && c.hasAscender) return rules[3];
    if (a.hasAscender && !b.hasAscender && !c.hasAscender) return rules[4];
    if (a.hasAscender && !b.hasAscender && c.hasAscender) return rules[5];
    if (a.hasAscender && b.hasAscender && !c.hasAscender) return rules[6];
    if (a.hasAscender && b.hasAscender && c.hasAscender) return rules[7];
    
    //return default
    return allBlocks[0];
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
