/* code snippets

display char on canvas
------
render() {
  textSize(12); //in points
  text(letter, x, y); //draw character 
} //end of render()



accept booleans describing typographic anatomy as
arguments in the constructor
------
WoodBlock(char tempLetter, boolean as, boolean des, boolean count, boolean serifs, 
            boolean low) {
    letter = tempLetter;
    hasAscender = as;
    hasDescender = des;
    hasCounter = count;
    hasSerifs = serifs;
    isLower = low; 

*/

