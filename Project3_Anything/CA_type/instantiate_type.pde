////////////////////////
//
// Mini library of sorts to instantiate WoodBlock objects
// since there are so many and they're so repetitive
// and only need to be referenced in full once

//template
//WoodBlock(String letter, ascender?, descender, counter?, lowercase?)

instantiateWoodBlocks() {
  //instantiate
  WoodBlock a = new WoodBlock("a", false, false, true, true);
  WoodBlock b = new WoodBlock("a", true, false, true, true);
  WoodBlock c = new WoodBlock("a", false, false, false, true);
  WoodBlock d = new WoodBlock("a", true, false, true, true);
  WoodBlock e = new WoodBlock("a", false, false, true, true);
  WoodBlock f = new WoodBlock("a", true, false, false, true);
  WoodBlock g = new WoodBlock("g", false, true, true, true);
  WoodBlock h = new WoodBlock("a", true, false, false, true);
  WoodBlock i = new WoodBlock("a", false, false, false, true);
  WoodBlock j = new WoodBlock("a", false, true, false, true);
  
  //initialize object array of WoodBlocks to iterate through
  WoodBlock[] allBlocks = {a, b, c, d, e, f, g, h, i, j};
}
