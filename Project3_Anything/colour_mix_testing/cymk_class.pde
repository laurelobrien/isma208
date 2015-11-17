class CMYK_Colour {

//fields
float cyan, magenta, yellow, black;

//constructor - requires colorMode(RGB,255) is set
CMYK_Colour(color c) {
//convert to CMY
cyan = 1 - (red(c) / 255);
magenta = 1 - (green(c) / 255);
yellow = 1 - (blue(c) / 255);
//convert to CMYK
black = 1; 
if (cyan < black) { black = cyan; }
if (magenta < black) { black = magenta; }
if (yellow < black) { black = yellow; }
cyan = ( cyan - black ) / ( 1 - black );
magenta = ( magenta - black ) / ( 1 - black );
yellow = ( yellow - black ) / ( 1 - black ); 
//convert to value between 0 and 100
cyan = cyan * 100;
magenta = magenta * 100;
yellow = yellow * 100;
black = black * 100;
}  

}  
