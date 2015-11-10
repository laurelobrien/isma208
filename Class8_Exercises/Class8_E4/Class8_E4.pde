// Import video library
import processing.video.*;

// Variable to store Movie instance.
Movie myVideo;

void setup() {
  background(0);
  size(640,340); // Same size as video
  
  // Instantiate Movie object and load video file.
  myVideo = new Movie(this, "transformers.mp4"); 
  myVideo.loop(); // Tell video to loop continuously
}

void draw() {
  // Uncomment these two calls to stretch out the video
  translate(0, -height*50);
  scale(1,100);
  image(myVideo, 0, 0); // Draw the last frame read from video.
}

// Called every time a new frame is available to read
void movieEvent(Movie myVideo) {
  myVideo.read();
}


