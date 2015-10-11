void draw() 
{
  background(128); //medium grey, erase last frame
  
  if (mouseX < width/2) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  
  ellipse(50, 50, 50, 50); //draw ellipse
}
