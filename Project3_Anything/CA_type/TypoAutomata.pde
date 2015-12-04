////////////////////////
//
// TypoAutomata class
// basic copy of Wolfram's CA as an entire object
// https://processing.org/examples/wolfram.html
//
// to do: better variable names

class TypoAutomata {
  ////////////////////////
  //attributes
  //WoodBlock[] stringGen;
  String[] letters; //array of characters
  String[] rules; //store the ruleset provided in constructor
  int generation; //count generations that have transpired
  int emSize; //height and width of each character in pixels (monospace font for now)
  
  String typeBlock; //actual character in reference to a wood type block, case sensitive
  String empty = "p"; //failed/dead/false version of attribute being checked for
  float x, y; //coordinate positions
  PFont apercu, cutive; //sans and serif monospace typefaces for simulating output
  
  ////////////////////////
  //constructor
  TypoAutomata(String[] r) {
    rules = r; //assign rules
    emSize = 16; //set font size
    letters = new String[width/emSize];
    
    apercu = createFont("ApercuProMono.ttf", 10); //Apercu Mono Pro
    cutive = createFont("CutiveMono.ttf", 10); //Cutive Mono
    
    //initialize letters[] with a seed array and generation as 0
    restart();
  }

  ////////////////////////
  //methods
  
  //set the rules
  void setRules(String[] argRules) {
    rules = argRules; //assign argument to object's attribute
  }
  
  
  //reset to generation 0
  void restart() {
    //for all indices in letters[]
    for (int i = 0; i < letters.length; i ++) {
      letters[i] = empty; //(re-)assign as character that indicates cell is empty
    }
    
    letters[letters.length/2] = "d"; //seed value in center of array
    generation = 0; //reset generation counter
  } //end of restart()
  
  
  //create a new generation by checking a letter's neighbours against a rule set
  //and storing its offspring in a new array
  void generate() {
    //create an empty array for the new String
    String[] nextGen = new String[letters.length];
    
    //for every letter in a 1D array, (except the ones on the edges 
    //without a full neighbourhood):
    for (int i = 1; i < letters.length-1; i ++) {
      //establish neighbourhood
      String left = letters[i-1];
      String me = letters[i];
      String right = letters[i+1];
      
      //compute next generation based on ruleset
      nextGen[i] = applyRules(left, me, right); 
    }
    
    //copy this new generation into the current generation, overwriting it
    for (int i = 1; i < letters.length-1; i ++) {
      letters[i] = nextGen[i];
    }
    
    generation ++; //increment generation counter
  } //end of generate()
  
  
  
  //draw current generation, letters[], on canvas.
  //currently draws actual grid of letters, will append to list of instructions
  //for printmaker in later version
  void render() {
    //for every index in letters[]
    for (int i = 0; i < letters.length; i ++) {
      if (findObject(letters[i]).hasAscender == true) {
        //fill(255); //set fill to black if it's an ascender
        fill(random(255), random(255), random(255));
        typeBlock = letters[i];
      } else {
        //fill(0); //or black if it is
        fill(200);
        typeBlock = empty;
      }
      //noStroke(); //turn off stroke
      //rect(i * emSize, generation * emSize, emSize, emSize); //draw "cell" version
      
      textFont(apercu); //set font to apercu mono, 7.5pt
      textAlign(CENTER); //align text's bottom-center with coordinates
      text(typeBlock, i * emSize, generation * emSize, emSize, emSize);
    }
  } //end of render()
    
    
    
  //implementing wolfram rules
  //1:0 :: !empty:empty
  String applyRules (String a, String b, String c) {
    //return applicable ruleset if any of the following are true
    if (!(a.equals(empty)) && !(b.equals(empty)) && !(c.equals(empty))) { return rules[0]; }
    if (!(a.equals(empty)) && !(b.equals(empty)) && c.equals(empty)) { return rules[1]; }
    if (!(a.equals(empty)) && b.equals(empty) && !(c.equals(empty))) { return rules[2]; }
    if (!(a.equals(empty)) && b.equals(empty) && c.equals(empty)) { return rules[3]; }
    if (a.equals(empty) && !(b.equals(empty)) && !(c.equals(empty))) { return rules[4]; }
    if (a.equals(empty) && !(b.equals(empty)) && c.equals(empty)) { return rules[5]; }
    if (a.equals(empty) && b.equals(empty) && !(c.equals(empty))) { return rules[6]; }
    if (a.equals(empty) && b.equals(empty) && c.equals(empty)) { return rules[7]; }
    
    //return 0 by default
    return matchDescender();
  } //end of applyRules()
  
  
  //is the CA grid finished?
  boolean finished() {
    //if another row (generation) the size of emSize won't fit on the canvas:
    if (generation > height/emSize) {
      return true; //CA is finished
    } else {
      return false; //CA is not finished
    }
  } //end of finished() (ha haa haaaaa)
  
  
}
