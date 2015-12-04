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
  String[] letters; //array of characters
  String[] rules; //store the ruleset provided in constructor
  int generation; //count generations that have transpired
  int emSize; //height and width of each character in pixels (monospace font for now)
  
  String typeBlock; //actual character in reference to a wood type block, case sensitive
  String empty = "-"; //failed/dead/false version of attribute being checked for
  float x, y; //coordinate positions
  PFont apercu;
  
  ////////////////////////
  //constructor
  TypoAutomata(String[] r) {
    rules = r; //assign rules
    emSize = 24; //set font size
    letters = new String[width/emSize];
    apercu = createFont("ApercuProMono.ttf", 16);
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
    for (int i = 0; i < letters.length; i ++) {
      letters[i] = empty; //assign as character that indicates cell is empty
    }
    letters[letters.length/2] = "a"; //need method for choosing this seed
    generation = 0; //reset generation counter
  } //end of restart()
  
  
  //create a new generation by checking a letter's neighbours
  //and storing its offspring in a new array
  void generate() {
    //create an empty array for the new characters
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
    
    //copy this new generation into the current generation (overwriting it)
    for (int i = 1; i < letters.length-1; i ++) {
      letters[i] = nextGen[i];
    }
    
    generation ++; //increment generation counter
  } //end of generate()
  
  
  
  //draw generation on canvas
  //currently draws CELLS (squares) for the purpose of testing but should draw type
  //with text() in a grid, or append instructions to a String list etc
  void render() {
    //for every index in letters[]
    
    for (int i = 0; i < letters.length; i ++) {
      if (letters[i] != "-") {
        //fill(255); //set fill to white if it isn't empty
        fill(random(255), random(255), random(255));
        typeBlock = "a";
      } else {
        //fill(0); //or black if it is
        fill(200);
        typeBlock = "-";
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
    return "-";
  } //end of executeRules()
  
  
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
