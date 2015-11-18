/*
Project 3
Laurel O'Brien
lobrien14692@ecuad.ca

[Project Description]
*/

String singleWord = "";
String sentence = "hello world!";
char sentenceChars[] = {'h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd', '!'};
String helloWorld = new String(sentenceChars);
TypeBucket abcBucket = new TypeBucket('a', 'b', 'c');

void setup() {
  size(640, 480);
  background(255);
  
  //select 10 letters from abcBucket and append them to singleWord
  for (int i = 0; i < 10; i ++) {
    singleWord += abcBucket.pullType();
  }
  //print them in a single string
  println(singleWord);
  println(sentence);
  println(helloWorld);
  
  
}

void draw() {
  
}