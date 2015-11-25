/*
Project 3
Laurel O'Brien
lobrien14692@ecuad.ca

Wood Type
*/

//import everything in PDF library
import processing.pdf.*;

//declare and initialize global variables
//
//
String inputString = "i can't do that dave."; //input text
char letter;
char[] charArray;
int numSpaces;

//values used for calculating PDF layout
float fontSize = 18; //point-size of loaded PFont
float lineLeading = fontSize * 1.4; //leading: looks best at 140% of text size for short-form
int numInstructions = 0; //count of instructions added to instructionList
float margin = 30; //pixel margin to stay inside, inset from edge of canvas

//Strings for drawing text on canvas
String instructionList = ""; //empty list of instructions
String header = "Pull one character from each bin.";
String spaces = "Use up to "+int(random(2, 5))+" spaces.";
String ink = "Ink the type with a mix of "+int(19)+" parts pthalo blue, "+int(47)+
" parts crimson red, and "+int(34)+" parts cadmium yellow.";

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
  //size(500, 700, PDF, "woodtype_test.pdf"); //pdf output size and file name
  size(500, 700); //canvas size for interactive portion
  background(255); //white background
  colorMode(RGB, 255); //declare colourspace for CMYK conversion
  
  apercu = createFont("ApercuProMono.ttf", fontSize); //initialize apercu font
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
  
  //convert inputString into a character array, and feed that array through newCheckBuckets
  //to determine which bucket each character can be found in
  newCheckBuckets(convertString(inputString));
  
  //lay out text boxes and type rules with directions for printer
  drawInstructions();
  
  println(numSpaces);
}



//return a character array containing all the characters in the argument's string
char[] convertString(String s) {
  //new character array has as many indices as there are characters in String s
  char[] charArray = new char[s.length()];
  //get each character from beginning to end of String s, and store in an index of charArray
  s.getChars(0, s.length(), charArray, 0);
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
          numInstructions ++;
        }
        if (char(letter) == char(' ')) {
          numSpaces ++;
        }
      }
    }
  }
}



//draw instructions to the canvas with 5 components:
//header: fixed instruction to select type from following bins
//spaces: how many spaces can be used
//ink: ratios of ink to mix
//instructionList: bins to select type from that was constructed in newCheckBuckets()
//rules: traditional type element (a straight line) that divides sections/information
void drawInstructions() {
  //textboxes dimensions
  float paramHeight = lineLeading * 7; //opening instructions always 7 lines in height
  float listHeight = (numInstructions+5) * lineLeading;  //list length of bins is variable
  float textBoxWidth = width - margin * 2; //both as wide as canvas minus left + right margins
  
  fill(0); //black fill for text
  stroke(240, 30, 30); //red stroke for (typographical) rules
  line(30, 30, width-30, 30); //rule framing header
  
  //draw all String instructions for printer as text inside one fixed text box
  //and one variable-height text box
  textAlign(LEFT); //align text to the left
  textFont(apercu); //set font to apercu mono
  textLeading(lineLeading);
  text(header+"\n\n"+spaces+"\n\n"+ink, margin, 50, textBoxWidth, paramHeight); //fixed height
  text(instructionList, margin, paramHeight+100, textBoxWidth, listHeight); //variable height
  line(margin, paramHeight+75, width-margin, paramHeight+75); //second rule dividing textboxes
}
