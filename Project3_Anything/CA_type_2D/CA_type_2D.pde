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
boolean wantColour = false;

////////////////////////////
//declare and initialize global variables

TypoAutomata reliefGrid; //instantiate 1D cellular automata

//array of WoodBlocks for every lowercase letter in the English alphabet
WoodBlock[] allBlocks = new WoodBlock[26];

//array of rules, prescribed outcomes for arrangements of letters
boolean[] xRuleSet; //x axis rules, vowel based
boolean[] yRuleSet; //y axis rules, anatomy based



//initial settings and values
void setup() {
  size(500, 800); //canvas size, aspect ratio of 15x24" poster size
  background(255); //white

  instantiateWoodBlocks(); //initialize allBlocks[] with new WoodBlocks
  
  //true == vowel, false == consonant
  boolean[] xRuleSet = { false, true,
                           false, true,
                           false, false,
                           true, false };
  
  //true == has ascender, false == has not
  boolean[] yRuleSet = { true, false, 
                           true, false, 
                           true, true, 
                           false, true};
                         
  
                         
  //reRandomizeRules();
  
  reliefGrid = new TypoAutomata(xRuleSet, yRuleSet); //instantiate TypoAutomata object with a rule set
  reliefGrid.render();
}



void draw() { 
} //end of draw()



void mouseClicked() {
  background(255); //white, erase last frame
  reliefGrid.generate(); //create new generation 
  reliefGrid.render();
}



//accepts a string describing the anatomy you want in a letter and pulls
//a random WoodBlock object from a pool of qualifying objects. using a String
//thus far makes it more legible than trying to reference a private 
//WoodBlock attribute but feels unnecessarily manual 
WoodBlock pullType(String anatomy) {
  ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  //declare ArrayList to append WoodBlocks that match argument
  //ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
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
  //vowels
  else if (anatomy.equals("vowel")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (allBlocks[i].isVowel) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  //consonants
  else if (anatomy.equals("no limbs")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (!allBlocks[i].isVowel) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  
  WoodBlock chosenType = possMatches.get(int(random(possMatches.size())));
  return chosenType;
} //end of pullType
