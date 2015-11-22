/*
Project 3
Laurel O'Brien
lobrien14692@ecuad.ca

[Project Description]
*/

//import everything in PDF library
import processing.pdf.*;

//declare and initialize global variables
//
//
String sentence = "i love austin"; //input text
char letter;
char[] charArray;

//Strings for drawing text on canvas
String instructionList = ""; //empty list of instructions
String header = "Pull one character from each of these bins.";
String spaces = "Use up to "+int(random(2, 5))+" spaces.";
String ink = "Ink the type with a mix of "+int(random(2, 33))+" parts Pthalo Green, "+int(random(2, 33))+
" parts Crimson Red, and "+int(random(2, 33))+" parts Ultramarine Blue.";

//declare PFont for drawing text in drawInstructions()
PFont apercu;

//declare array of TypeBucket objects
TypeBucket[] allBuckets; 

//declare and instantiate TypeBuckets for each real bucket of type at ECUAD
TypeBucket abcBucket = new TypeBucket('a', 'b', 'c');
TypeBucket defBucket = new TypeBucket('d', 'e', 'f');
TypeBucket ghiBucket = new TypeBucket('g', 'h', 'i');
TypeBucket jklBucket = new TypeBucket('j', 'k', 'l');
TypeBucket mnoBucket = new TypeBucket('m', 'n', 'o');
TypeBucket pqrBucket = new TypeBucket('p', 'q', 'r');
TypeBucket stuBucket = new TypeBucket('s', 't', 'u');
TypeBucket vwxBucket = new TypeBucket('v', 'w', 'x');
TypeBucket yzBucket = new TypeBucket('y', 'z', '!');



void setup() {
  size(500, 700, PDF, "woodtype_test.pdf"); //pdf output size and file name
  //size(500, 700); //canvas size for non-PDF test runs
  background(255); //white background
  apercu = createFont("ApercuProMono.ttf", 18); //initialize apercu font
  allBuckets = new TypeBucket[9]; //create array to store all available TypeBuckets
  
  //initialize allBuckets[] with all TypeBucket instances
  allBuckets[0] = abcBucket;
  allBuckets[1] = defBucket;
  allBuckets[2] = ghiBucket;
  allBuckets[3] = jklBucket;
  allBuckets[4] = mnoBucket;
  allBuckets[5] = pqrBucket;
  allBuckets[6] = stuBucket;
  allBuckets[7] = vwxBucket;
  allBuckets[8] = yzBucket;
  
  //convert sentence into a character array, and feed that array through newCheckBuckets
  //to determine which bucket each character can be found in
  newCheckBuckets(convertString(sentence));
  
  //call drawInstructions to format and draw complete set of instructions
  drawInstructions();
  //println(instructionList);
  
  exit(); //save and exit pdf file
  println("Drawn and saved."); //indicate setup() has finished, including writing to PDF
}


void draw() {
  
}



//return a character array containing all the characters in the argument's string
char[] convertString(String s) {
  //new character array has as many indices as there are characters in String s
  char[] charArray = new char[s.length()];
  //get each character from beginning to end of String s, and store in an index of charArray
  s.getChars(0, s.length()-1, charArray, 0);
  //return the char[] charArray
  return charArray;
}


//identify which bucket each character in a character array comes from.
//add the bucket's name to a list of instructions to be printed later.
void newCheckBuckets(char x[]) {
  //for every character in the argument's array:
  for (int i = 0; i < x.length; i ++) {
    //for every bucket of type:
    for (int j = 0; j < allBuckets.length; j ++) {
      //for the three characters that normally go in that bucket
      for (int k = 0; k < 3; k ++) {
        letter = x[i];
        //check if the argument character matches any of the bucket's characters
        if (letter == allBuckets[j].bucketContents[k]) {
          //if so, use TypeBucket's method .identifier() to append its name to instructionList
          instructionList += allBuckets[j].identifier;
        }
      }
    }
  }
}



//draw instructions to the canvas
//header: general instructions to select type from following bins
//spaces: how many spaces can be used
//instruction list: list of bins to select type from via variable instructionList
//ink: ratio of ink to mix to print letters
void drawInstructions() {
  fill(0); //black fill
  stroke(240, 30, 30); //black stroke
  line(30, 30, width-30, 30);
  textFont(apercu); //apercu mono
  text(header+"\n"+spaces+"\n\n"+instructionList, 30, 50, width-60, height-250);
  line(30, height-180, width-30, height-180);
  text(ink, 30, height-160, width-60, height-160);
}
