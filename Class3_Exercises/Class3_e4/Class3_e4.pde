//draw 10 20x20 ellipses with random fills and random positions
void draw() {
  background(128);
  
  //
  for(int colour = 0; colour < 10; colour ++) {
    fill(random(255), random(255), random(255));
    ellipse(random(width), random(height), 20, 20);
  }
}
