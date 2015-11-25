/*
NOTES

- allAscenders contains d in all its indices even though b.ascender == true
- categorization logic needs refining
*/


//instance template: WoodBlock(char, ascender, descender, lowerCase, vowel, punct, numeral);
WoodBlock a = new WoodBlock('a', false, false, true, true, false, false);
WoodBlock b = new WoodBlock('b', true, false, true, false, false, false);
WoodBlock c = new WoodBlock('c', false, false, true, false, false, false);
WoodBlock d = new WoodBlock('d', true, false, true, false, false, false);
WoodBlock e = new WoodBlock('e', false, false, true, true, false, false);

char myChar = 'b'; //testin

char[] finalType = new char[20]; //array of chars to save selected type
//WoodBlock allChars = new WoodBlock[5]; //array of all possible type as WoodBlock objects
WoodBlock[] allAscenders = new WoodBlock[5]; //array of WoodBlock objects with ascenders to iterate through

WoodBlock[] allChars = {a, b, c, d, e}; //initialize allChars


void setup() {  
  //initialize allAscenders[]
  //
  //for all indices in allAscenders
  for (int i = 0; i < allAscenders.length; i ++) {
    //for all WoodBlock objects in allChars[]
    for (int j = 0; j < allChars.length; j ++) {
      //if the object has an ascender
      if (allChars[j].ascender == true) {
        allAscenders[i] = allChars[j]; //add the object to the allAscenders[] array
      }
    }
  } //end of init allAscenders[]
  
  println(allAscenders[0].x); //print the x attribute of the WoodBlock object in first index
  
}

void draw() {}
