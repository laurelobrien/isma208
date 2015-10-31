//declare and initialize global variables
float f = 0; //modified frame count

void setup() 
{
  background(#12deef); //cyan
  stroke(#ffffff); //white
  strokeWeight(3); //3px stroke
  noFill(); //remove fill
  size(600, 400); //canvas size
  smooth();
  frameRate(25);
}

//draw an ellipse follow a bezier curve path
void draw() 
{
  f += 0.1;
  background(#12deef); //cyan: erase last frame
  
  //bezier curve path
  beginShape();
    vertex(110.0, 153.0);
    bezierVertex(110.0, 153.0, 109.0, 153.0, 110.0, 153.0); //bezierVertex #1
    bezierVertex(111.0, 153.0, 167.0, 34.0, 238.0, 119.0); //#2
    bezierVertex(309.0, 204.0, 308.0, 194.0, 345.0, 141.0); //#3
    bezierVertex(382.0, 88.0, 352.0, -1.0, 311.0, 61.0); //#4
    bezierVertex(270.0, 123.0, -15.0, 337.0, 161.0, 349.0); //#5
    bezierVertex(337.0, 361.0, 510.0, 201.0, 364.0, 222.0); //#6
    bezierVertex(218.0, 243.0, 82.0, 235.0, 110.0, 155.0); //#7
  endShape();
  
  //assign x,y position depending on modified frame count
  //
  //bezierVertex #1
  if (f < 1) {
     float x = bezierPoint( 110,110,109, 110, f);
     float y = bezierPoint( 153,153,153, 153, f);
     ellipse( x, y, 10, 10 );
     //#2
   } else if ( f < 2 ) {
     float x = bezierPoint( 110,111,167, 238, f-1);
     float y = bezierPoint( 153,153,34, 119, f-1);
     ellipse( x, y, 10, 10 );
     //#3
   } else if ( f < 3 ) {
     float x = bezierPoint( 238,309,308, 345, f-2);
     float y = bezierPoint( 119,204,194, 141, f-2);
     ellipse( x, y, 10, 10 );
     //#4
   } else if ( f < 4 ) {
     float x = bezierPoint( 345,382,352, 311, f-3);
     float y = bezierPoint( 141,88,-1, 61, f-3);
     ellipse( x, y, 10, 10 );
     //#5
   } else if ( f < 5 ) {
     float x = bezierPoint( 311,270,-15, 161, f-4);
     float y = bezierPoint( 61,123,337, 349, f-4);
     ellipse( x, y, 10, 10 );
     //#6
   } else if ( f < 6 ) {
     float x = bezierPoint( 161,337,510, 364, f-5);
     float y = bezierPoint( 349,361,201, 222, f-5);
     ellipse( x, y, 10, 10 );
     //#7
   } else if ( f < 7 ) {
     float x = bezierPoint( 364,218,82, 110, f-6);
     float y = bezierPoint( 222,243,235, 155, f-6);
     ellipse( x, y, 10, 10 );
   } //ellipse at starting point: reset modified frame count
     else if ( f > 7 ) {
     f = 0;
   }
   
   println(f);
}

