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
  boolean hasAscender, hasDescender, hasCounter, isLower;
  //variable type anatomy: prescence depends on typeface used
  boolean hasSerifs;
  
  /////////////////////
  //constructor
  WoodBlock(String tempLetter, boolean as, boolean des, boolean count, boolean low) {
    letter = tempLetter;
    hasAscender = as;
    hasDescender = des;
    hasCounter = count;
    isLower = low; 
  }
  
  /////////////////////
  //methods
  
  //print human-friendly identify to output — mostly for debugging
  void identify() {
    println("WoodBlock instance: "+letter);
  }
  
} //end of Wood Block

