/*
CA
or something like it

lobrien14692@ecuad.ca
*/



/* toggle this to turn colour indicators on/off. final output
   will be monochrome but it makes it faster to identify pattern
   when de-bugging
----------------------------------------------------------*/
boolean wantColour = false;



/*declare and initialize global variables
----------------------------------------------------------*/
TypoAutomata reliefGrid; //instantiate 2D cellular automata

//array of WoodBlocks for every lowercase letter in the English alphabet
WoodBlock[] allBlocks = new WoodBlock[26];

//array of rules; prescribed offspring for arrangements of letters
boolean[] xRuleSet; //x axis rules, vowel based
boolean[] yRuleSet; //y axis rules, typographic anatomy based

//values for laying out type in a grid via reliefGrid.render(),
//and transforming that rendering to be mirrored
int fontSize = 24; //font size in points
int emSize = int(fontSize * 1.4);//textbox dimensions
//number of r and columns, variable with textbox size
//and always -2 to allow one row/column of margin on each side
int col = int(emSize * (width / emSize))-2;
int row = int(emSize * (height / emSize))-2; 



//initial settings and values
void setup() {
  size(500, 800); //canvas size, aspect ratio of 15x24" poster size
  background(255); //white
  instantiateWoodBlocks(); //initialize allBlocks[] with new WoodBlocks
  
  /* declare & initialize rule sets for evaluating
     generations of TypoAutomata objects on their x and y axes
---------------------------------------------------------*/
  //x axis: true == vowel, false == consonant
  boolean[] xRuleSet = { false, true,
                         false, true,
                         false, false,
                         true, false };
  //y axis: true == has ascender, false == has not
  boolean[] yRuleSet = { true, false, 
                         true, false, 
                         true, true, 
                         false, true};
  
  //instantiate TypoAutomata object with 2 rule sets
  reliefGrid = new TypoAutomata(xRuleSet, yRuleSet, fontSize);
  
  /* mirror grid of type horizontally to create template
     for setting type, which needs to be set backwards.
     note: transformations happen in reverse order
---------------------------------------------------------*/
  pushMatrix(); //isolate memory for transformations
  translate(((emSize * (width/emSize))/2), ((emSize * (height/emSize))/2)); //translate back to final position
  scale(-1, 1); //negative scaling on horizontal axis: mirroring
  translate(-((emSize * (width/emSize-2))/2),-((emSize * (height/emSize-2))/2)); //translate center of reliefGrid's to canvas origin (0, 0)
  reliefGrid.render(); //render the first generation on canvas
  popMatrix(); //done isolating memory
}


//descrip. still needed here
void draw() {
  //empty: drawing only happens when mouse is clicked
}



//on mouse click, any button:
void mouseClicked() {
  background(255); //white, erase last frame
  reliefGrid.generate(); //create new generation 
  reliefGrid.render(); //render new generation on canvas
}
