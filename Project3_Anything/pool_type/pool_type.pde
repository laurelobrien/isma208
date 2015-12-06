/*
CA
or something like it

lobrien14692@ecuad.ca

ruleSet, initialized in setup(), works correctly except that the random selections
become fixed after it's initialized, and re-declaring it in draw or re-assigning
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

//array lists that pool WoodBlocks with a common piece of anatomy together:
//a WoodBlock can appear in more than one list, 
//i.e. "p" fits in ascendMatches and counterMatches
ArrayList<WoodBlock> ascendMatches = new ArrayList<WoodBlock>();
ArrayList<WoodBlock> descendMatches = new ArrayList<WoodBlock>();
ArrayList<WoodBlock> counterMatches = new ArrayList<WoodBlock>();
ArrayList<WoodBlock> noLimbMatches = new ArrayList<WoodBlock>();



//initial settings and values
void setup() {
  size(510, 810); //canvas size
  background(255); //white

  instantiateWoodBlocks(); //initialize allBlocks[] with new WoodBlocks
  poolType(); //initialize array lists of anatomically similar WoodBlocks
  
  //initialize ruleSet (will be re-initialized every letter in reliefGrid.applyRules())
  //alive/dead = has ascender/doesn't have ascender
  WoodBlock[] ruleSet = {ascendMatches.get(int(random(ascendMatches.size()))), descendMatches.get(int(random(descendMatches.size()))), 
                         noLimbMatches.get(int(random(counterMatches.size()))), descendMatches.get(int(random(descendMatches.size()))), 
                         ascendMatches.get(int(random(ascendMatches.size()))), ascendMatches.get(int(random(ascendMatches.size()))), 
                         descendMatches.get(int(random(descendMatches.size()))), counterMatches.get(int(random(ascendMatches.size())))};
                         
  //reRandomizeRules();
  
  reliefGrid = new TypoAutomata(ruleSet); //instantiate TypoAutomata object with a rule set
}


void draw() { 
  //if rendering reliefGrid hasn't reached bottom of canvas yet
  if (!reliefGrid.finished()) {
    reliefGrid.render(); //draw the current generation
    //reliefGrid.setRules(ruleSet);
    reliefGrid.generate(); //create the next generation
  }
} //end of draw()



//called once in setup() to initialize array lists
void poolType() {
  //declare ArrayList to append WoodBlocks that match argument
  //ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
  //ascenders
  for (int i = 0; i < allBlocks.length; i ++) {
    if (allBlocks[i].hasAscender) {
      ascendMatches.add(allBlocks[i]);
    }
  }

  //descenders
  for (int i = 0; i < allBlocks.length; i ++) {
    if (allBlocks[i].hasDescender) {
      descendMatches.add(allBlocks[i]);
    }
  }
  
  //counters
  for (int i = 0; i < allBlocks.length; i ++) {
    if (allBlocks[i].hasCounter) {
      counterMatches.add(allBlocks[i]);
    }
  }
  
  //no ascenders or descenders
  for (int i = 0; i < allBlocks.length; i ++) {
    if (!allBlocks[i].hasAscender && !allBlocks[i].hasDescender) {
      noLimbMatches.add(allBlocks[i]);
    }
  }
} //end of poolType()
