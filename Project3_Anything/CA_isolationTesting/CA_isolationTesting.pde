String ascender, descender;
String[] letters = {"a","b","c","d","e"};
WoodBlock[] allBlocks = new WoodBlock[26];

void setup () {
  //ascender = matchAscender();
  //descender = matchDescender();
  instantiateWoodBlocks();
  
  WoodBlock left = allBlocks[1];
  WoodBlock me = allBlocks[0];
  WoodBlock right = allBlocks[5];
  
  //if (left.hasAscender && !me.hasAscender && right.hasAscender) {println("2 have ascenders.");}
  //else {println("All, none, or one has an ascender.");}
  
  println(pullType("counter").letter);
}

String matchAscender() {
  return letters[int(random(5))];
}

String matchDescender() {
  return letters[int(random(5))];
}


//determine what to check for via String argument before choosing random WoodBlock objects
//and returning them as the value of this function
WoodBlock pullType(String anatomy) {
  //declare ArrayList to append WoodBlocks who meet criteria
  ArrayList<WoodBlock> possMatches = new ArrayList<WoodBlock>();
  
  if (anatomy.equals("ascender")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (allBlocks[i].hasAscender) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  
  if (anatomy.equals("descender")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (allBlocks[i].hasDescender) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  
  if (anatomy.equals("counter")) {
    for (int i = 0; i < allBlocks.length; i ++) {
      if (allBlocks[i].hasCounter) {
        possMatches.add(allBlocks[i]);
      }
    }
  }
  
  WoodBlock chosenType = possMatches.get(int(random(possMatches.size())));
  return chosenType;
}
