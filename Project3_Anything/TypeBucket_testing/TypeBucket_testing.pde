/*
Project 3
Laurel O'Brien
lobrien14692@ecuad.ca

[Project Description]
*/

char letter;
String singleWord = "";
String sentence = "hello world!";
char sentenceChars[] = {'h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd', '!'};

String helloWorld = new String(sentenceChars);
String instructionList = ""; //empty list of instructions
String header = "Pull one character from each of these bins.";
String spaces = "Use up to "+int(random(2, 5))+" spaces.";
String ink = "Ink the type with a mix of "+int(random(2, 33))+" parts Pthalo Green, "+int(random(2, 33))+
" parts Crimson Red, and "+int(random(2, 33))+" parts Ultramarine Blue.";

PFont apercu;

TypeBucket[] allBuckets; //array of TypeBucket objects
TypeBucket abcBucket = new TypeBucket('a', 'b', 'c');
TypeBucket defBucket = new TypeBucket('d', 'e', 'f');
TypeBucket ghiBucket = new TypeBucket('g', 'h', 'i');
TypeBucket jklBucket = new TypeBucket('j', 'k', 'l');
TypeBucket mnoBucket = new TypeBucket('m', 'n', 'o');
TypeBucket pqrBucket = new TypeBucket('p', 'q', 'r');
TypeBucket stuBucket = new TypeBucket('s', 't', 'u');
TypeBucket vwxBucket = new TypeBucket('v', 'w', 'x');
TypeBucket yzBucket = new TypeBucket('y', 'z', '!');

/*
for each index in charList[]
identify which bucket it goes in
print bucket identifier
*/

void setup() {
  size(500, 700);
  background(255);
  apercu = createFont("ApercuProMono.ttf", 18);
  allBuckets = new TypeBucket[9];
  
  //select 10 letters from abcBucket and append them to singleWord
  for (int i = 0; i < 10; i ++) {
    singleWord += abcBucket.pullType();
  }
  
  //initialize allBuckets[]
  allBuckets[0] = abcBucket;
  allBuckets[1] = defBucket;
  allBuckets[2] = ghiBucket;
  allBuckets[3] = jklBucket;
  allBuckets[4] = mnoBucket;
  allBuckets[5] = pqrBucket;
  allBuckets[6] = stuBucket;
  allBuckets[7] = vwxBucket;
  allBuckets[8] = yzBucket;
  
  //println(abcBucket.identifier);
  //println(allBuckets[0].identifier);
  
  //checkBuckets(g, a, p);
  newCheckBuckets(sentenceChars);
  drawInstructions();
  println(instructionList);
}

void draw() {
  
}


void newCheckBuckets(char x[]) {
  for (int i = 0; i < x.length; i ++) {
    for (int j = 0; j < allBuckets.length; j ++) {
      for (int k = 0; k < 3; k ++) {
        letter = x[i];
        if (letter == allBuckets[j].bucketContents[k]) {
          instructionList += allBuckets[j].identifier;
        }
      }
    }
  }
}

void drawInstructions() {
  fill(0); //black fill
  stroke(240, 30, 30); //black stroke
  line(30, 30, width-30, 30);
  textFont(apercu); //apercu mono
  text(header+"\n"+spaces+"\n\n"+instructionList, 30, 50, width-60, height-250);
  line(30, height-180, width-30, height-180);
  text(ink, 30, height-160, width-60, height-160);
}

//allBuckets -> abcBucket -> .bucketContents[CHECK THIS]
//allBuckets[abcBucket.bucketContents[0]]
//check each bucket to see if a character can be found inside of it
void checkBuckets(char x, char y, char z) {
  for (int i = 0; i < allBuckets.length; i ++) {
    for (int j = 0; j < 3; j ++) {
      if (x == allBuckets[i].bucketContents[j]) {
        instructionList += allBuckets[i].identifier;
      }
    }
  }
  
  for (int i = 0; i < allBuckets.length; i ++) {
    for (int j = 0; j < 3; j ++) {
      if (y == allBuckets[i].bucketContents[j]) {
        instructionList += allBuckets[i].identifier;
      }
    }
  }
  
  for (int i = 0; i < allBuckets.length; i ++) {
    for (int j = 0; j < 3; j ++) {
      if (z == allBuckets[i].bucketContents[j]) {
        instructionList += allBuckets[i].identifier;
      }
    }
  }
}
