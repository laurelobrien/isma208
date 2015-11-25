//WoodBlock class

class WoodBlock {
  //attributes
  char x; //latin character
  String idCase; //string for identifying letter's case (upper or lower)
  
  //various attributes to parse (and construct) character: true == attribute is present
  boolean ascender, descender, lowerCase, vowel, punct, numeral;

  //constructor
  WoodBlock(char letter, boolean tempAs, boolean tempDes, boolean tempCase, 
    boolean tempVowel, boolean tempPunct, boolean tempNum) {
    x = letter;
    ascender = tempAs;
    descender = tempDes;
    lowerCase = tempCase;
    vowel = tempVowel;
    punct = tempPunct;
    numeral = tempNum;
  }

//methods
//
//print character and case to the console
void identify() {
  if (lowerCase) {
    idCase = "lowercase";
  } else {
    idCase = "uppercase";
  }
  println(idCase + " " + x); //string output of upper/lowercase and actual character
}

//return truth of argument char y matching WoodBlock constructor char x
boolean matchChar(char y) {
  if (y == x) {
    return true;
  } else {
    return false;
  }
}

} //end of TypeBucket
