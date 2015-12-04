/*
CA
or something like it
*/

//declare and initialize global variables
TypoAutomata reliefGrid; //instance of modified Wolfram basic Cellular Automata
String ascender, descender, counter; //store letter which has an ascender or descender
WoodBlock a, b, c, d, e, f, g, h, i, j;

//array of WoodBlocks for every lower- and upper-case letter in the English alphabet
WoodBlock[] allBlocks = new WoodBlock[26];


//initial settings and values
void setup() {
  size(500, 800); //canvas size
  background(255); //white
  String[] rules = {"-", "a", "-", "a", "a", "-", "a", "-"}; //temporary wolfram ruleset
  String[] rules2 = {matchAscender(), matchDescender(), matchAscender(), matchDescender(),
                   matchDescender(), matchAscender(), matchDescender(), matchAscender()};

  reliefGrid = new TypoAutomata(rules2); //instantiate TypoAutomata object
  instantiateWoodBlocks(); //initialize allBlocks[] with new WoodBlocks
                     
  //assign random Strings to variables, qualified through matchSomething()
  ascender = matchAscender(); //assign a random WoodBlock where .hasAscender == true
  descender = matchDescender(); //same, but for .hasDescender
  counter = matchCounter();
}



//main loop
void draw() {
  //if rendering reliefGrid hasn't reached bottom of canvas yet
  if (reliefGrid.finished() == false) {
    reliefGrid.render(); //draw the current generation
    reliefGrid.generate(); //create the next generation
  } 
} //end of draw


//feed a String to get its associated WoodBlock object; "a" returns object a
WoodBlock getObject(String input) {
  //for all indices in allBlocks[]
  for (int i = 0; i < allBlocks.length; i ++) {
    //if the object's .letter String is equivalent to the argument input
    if ((allBlocks[i].letter).equals(input)) {
      return allBlocks[i]; //return the entire object
    }
    else {
      return allBlocks[0];
    }
  }
} //end of getObject



//short-list WoodBlocks that have an ascender, choose one at random, and
//return its .letter String so it can be used for making rulesets and comparing equivalency
String matchAscender() {
  //declare array list for storing WoodBlock objects that match boolean requirements
  ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
  //for all WoodBlocks in allBlocks[]
  for (int i = 0; i < allBlocks.length; i ++) {   
    //if the WoodBlock object has an ascender
    if (allBlocks[i].hasAscender == true) {
      possMatches.add(allBlocks[i]); //add it to the pool of possible matches
    }
  }
  
  //assign chosenLetter as the identifying String (.letter) of a random 
  //WoodBlock object in possMatches and return it
  String chosenLetter = possMatches.get(int(random(possMatches.size()-1))).letter;
  return chosenLetter;
} //end of matchAscender()



//same as above but for WoodBlock.hasDescender
String matchDescender() {
  //declare array list for storing WoodBlock objects that match boolean requirements
  ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
  //for all WoodBlocks in allBlocks[]
  for (int i = 0; i < allBlocks.length; i ++) {   
    //if the WoodBlock object has a descender
    if (allBlocks[i].hasDescender == true) {
      possMatches.add(allBlocks[i]); //add it to the pool of possible matches
    }
  }
  
  //assign chosenLetter as the identifying String (.letter) of a random 
  //WoodBlock object in possMatches and return it
  String chosenLetter = possMatches.get(int(random(possMatches.size()-1))).letter;
  return chosenLetter;
} //end of matchDescender()



//same as above but for WoodBlock.hasCounter
String matchCounter() {
  //declare array list for storing WoodBlock objects that match boolean requirements
  ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
  //for all WoodBlocks in allBlocks[]
  for (int i = 0; i < allBlocks.length; i ++) {   
    //if the WoodBlock object has a descender
    if (allBlocks[i].hasCounter == true) {
      possMatches.add(allBlocks[i]); //add it to the pool of possible matches
    }
  }
  
  //assign chosenLetter as the identifying String (.letter) of a random 
  //WoodBlock object in possMatches and return it
  String chosenLetter = possMatches.get(int(random(possMatches.size()-1))).letter;
  return chosenLetter;
} //end of matchDescender()



//same as above but for WoodBlock.isLower
String matchCase() {
  //declare array list for storing WoodBlock objects that match boolean requirements
  ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
  //for all WoodBlocks in allBlocks[]
  for (int i = 0; i < allBlocks.length; i ++) {   
    //if the WoodBlock object has a descender
    if (allBlocks[i].isLower == true) {
      possMatches.add(allBlocks[i]); //add it to the pool of possible matches
    }
  }
  
  //assign chosenLetter as the identifying String (.letter) of a random 
  //WoodBlock object in possMatches and return it
  String chosenLetter = possMatches.get(int(random(possMatches.size()-1))).letter;
  return chosenLetter;
} //end of matchDescender()



