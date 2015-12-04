/*
CA
or something like it
*/

//declare and initialize global variables
TypoAutomata reliefGrid; //instance of modified Wolfram basic Cellular Automata
String ascender, descender, noLimbs; //store letter which has an ascender or descender



//set that shit up once
void setup() {
  size(500, 800); //canvas size
  background(255); //white
  String[] rules = {"-", "a", "-", "a", "a", "-", "a", "-"}; //what would a ruleset be for states
                                            //beyond i/o?
  instantiateWoodBlocks();
  reliefGrid = new TypoAutomata(rules); //instantiate TypoAutomata object
}



//run this shit continuously
//? or not, this program isn't animated so far ?
void draw() {
  if (reliefGrid.finished() == false) {
    reliefGrid.render(); //draw the cellular automata
    reliefGrid.generate(); //create the next generation
  } 
} //end of draw


