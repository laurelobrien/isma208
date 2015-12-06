////////////////////////
//
// WoodBlock class
// defines a letter in the roman alphabet, case sensitive
//
// to do: better variables names


class WoodBlock {

  /////////////////////
  //attributes
  String letter;
  
  //fixed type anatomy: always occurs in the letter
  boolean hasAscender, hasDescender, hasCounter, isVowel;
  //variable type anatomy: prescence depends on typeface used
  boolean hasSerifs;
  
  /////////////////////
  //constructor
  WoodBlock(String tempLetter, boolean as, boolean des, boolean count, boolean vowel) {
    letter = tempLetter;
    hasAscender = as;
    hasDescender = des;
    hasCounter = count;
    isVowel = vowel; 
  }
  
  /////////////////////
  //methods
  
  
} //end of Wood Block

