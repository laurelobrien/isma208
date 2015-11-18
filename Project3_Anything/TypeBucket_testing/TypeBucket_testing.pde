/*
Project 3
Laurel O'Brien
lobrien14692@ecuad.ca

[Project Description]
*/

char g = 'g';
char a = 'a';
char p = 'p';
String singleWord = "";
String sentence = "hello world!";
char sentenceChars[] = {'h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd', '!'};
String helloWorld = new String(sentenceChars);
String instructionList = ""; //empty list of instructions
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

void setup() {
  size(640, 480);
  background(255);
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
  println(allBuckets[0].identifier);
  
  checkBuckets(g, a, p);
  println(instructionList); //
}

void draw() {
  
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
