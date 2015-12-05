/*
CA
or something like it

lobrien14692@ecuad.ca

ruleSet, initialized in setup(), works correctly except that the random selections
become fixed after its initialized, and re-declaring it in draw or re-assigning
it to reliefGrid.rules in attempts to re-randomize its values draws an error
*/

//toggle this to turn colour indicators on/off. final output
//will be monochrome but it makes it faster to identify pattern
//when de-bugging
boolean wantColour = true;

////////////////////////////
//declare and initialize global variables

TypoAutomata reliefGrid; //instantiate 1D cellular automata

//array of WoodBlocks for every lowercase letter in the English alphabet
WoodBlock[] allBlocks = new WoodBlock[26];
WoodBlock[] ruleSet;

//initial settings and values
void setup() {
  size(510, 810); //canvas size
  background(255); //white

  instantiateWoodBlocks(); //initialize allBlocks[] with new WoodBlocks
  
  //temporary wolfram rule set (rule 30) just for testing basic stuff works:
  //alive/dead = has ascender/doesn't have ascender
  WoodBlock[] ruleSet = {pullType("ascender"), pullType("descender"), 
                         pullType("ascender"), pullType("descender"), 
                         pullType("ascender"),pullType("ascender"), 
                         pullType("descender"), pullType("counter")};
                         
  //reRandomizeRules();
  
  reliefGrid = new TypoAutomata(ruleSet); //instantiate TypoAutomata object with a rule set

  println(pullType("ascender").letter);
}


void draw() { 
  //if rendering reliefGrid hasn't reached bottom of canvas yet
  if (!reliefGrid.finished()) {
    reliefGrid.render(); //draw the current generation
    reliefGrid.generate(); //create the next generation
  }
} //end of draw()



//accepts a string describing the anatomy you want in a letter and pulls
//a random WoodBlock object from a pool of qualifying objects. using a String
//thus far makes it more legible than trying to reference a private 
//WoodBlock attribute but feels unnecessarily manual 
WoodBlock pullType(String anatomy) {
  //declare ArrayList to append WoodBlocks that match argument
  ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
  //ascenders
  if (anatomy.equals("ascender")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (allBlocks[i].hasAscender) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  //descenders
  else if (anatomy.equals("descender")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (allBlocks[i].hasDescender) {
        possMatches.add(allBlocks[i]);
      }
    }
  } 
  //counters
  else if (anatomy.equals("counter")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (allBlocks[i].hasCounter) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  //no ascenders OR descenders
  else if (anatomy.equals("no limbs")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (!allBlocks[i].hasAscender && !allBlocks[i].hasDescender) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  
  WoodBlock chosenType = possMatches.get(int(random(possMatches.size())));
  return chosenType;
}



void reRandomizeRules() {
  WoodBlock[] ruleSet = {pullType("ascender"), pullType("ascender"), 
                         pullType("counter"), pullType("ascender"), 
                         pullType("ascender"),pullType("descender"), 
                         pullType("ascender"), pullType("counter")};
}
