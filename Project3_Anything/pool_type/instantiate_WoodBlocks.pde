////////////////////////
//
// Mini library of sorts to instantiate WoodBlock objects
// since there are so many and they're so repetitive
// and only need to be referenced in full once

//template
//WoodBlock(String "letter", ascender?, descender?, counter?, lowercase?)

void instantiateWoodBlocks() {
  //instantiate
  allBlocks[0] = new WoodBlock("a", false, false, true, true);
  allBlocks[1] = new WoodBlock("b", true, false, true, true);
  allBlocks[2] = new WoodBlock("c", false, false, false, true);
  allBlocks[3] = new WoodBlock("d", true, false, true, true);
  allBlocks[4] = new WoodBlock("e", false, false, true, true);
  allBlocks[5] = new WoodBlock("f", true, false, false, true);
  allBlocks[6] = new WoodBlock("g", false, true, true, true);
  allBlocks[7] = new WoodBlock("h", true, false, false, true);
  allBlocks[8] = new WoodBlock("i", false, false, false, true);
  allBlocks[9] = new WoodBlock("j", false, true, false, true);
  allBlocks[10] = new WoodBlock("k", true, false, false, true);
  allBlocks[11] = new WoodBlock("l", true, false, false, true);
  allBlocks[12] = new WoodBlock("m", false, false, false, true);
  allBlocks[13] = new WoodBlock("n", false, false, false, true);
  allBlocks[14] = new WoodBlock("o", false, false, true, true);
  allBlocks[15] = new WoodBlock("p", false, true, true, true);
  allBlocks[16] = new WoodBlock("q", false, true, true, true);
  allBlocks[17] = new WoodBlock("r", false, false, false, true);
  allBlocks[18] = new WoodBlock("s", false, false, false, true);
  allBlocks[19] = new WoodBlock("t", true, false, false, true);
  allBlocks[20] = new WoodBlock("u", false, false, false, true);
  allBlocks[21] = new WoodBlock("v", false, false, false, true);
  allBlocks[22] = new WoodBlock("w", false, false, false, true);
  allBlocks[23] = new WoodBlock("x", false, false, false, true);
  allBlocks[24] = new WoodBlock("y", false, true, false, true);
  allBlocks[25] = new WoodBlock("z", false, false, false, true);
}

