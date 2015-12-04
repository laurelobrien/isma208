/*
CA
or something like it
*/

//declare and initialize global variables
TypoAutomata reliefGrid; //instance of modified Wolfram basic Cellular Automata
String ascender, descender, counter; //store letter which has an ascender or descender

//array of WoodBlocks for every lower- and upper-case letter in the English alphabet
WoodBlock[] allBlocks = new WoodBlock[26];


//initial settings and values
void setup() {
  size(500, 800); //canvas size: poster aspect ratio
  background(255);
  String[] ruleSet1 = {"-", "a", "-", "a", "a", "-", "a", "-"}; //temporary wolfram ruleset
  
  //this should contain functions? booleans? something that indicates what sort of
  //anatomy to base letter choice on
  instantiateWoodBlocks(); //initialize allBlocks[] with new WoodBlocks
  WoodBlock[] ruleSet = {allBlocks[0], allBlocks[1], allBlocks[0], allBlocks[1], allBlocks[1],
                       allBlocks[0], allBlocks[1], allBlocks[0]};
  
  reliefGrid = new TypoAutomata(ruleSet); //instantiate TypoAutomata object with a rule set
  
  //reliefGrid.restart();
  //println(reliefGrid.currentGen);
}


void draw() {
  //if rendering reliefGrid hasn't reached bottom of canvas yet
  if (reliefGrid.finished() == false) {
    reliefGrid.render(); //draw the current generation
    reliefGrid.generate(); //create the next generation
  }
} //end of draw()
