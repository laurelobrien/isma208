// Import video library
import processing.video.*;  

// Variable to store Movie instance.
Movie myVideo;  

void setup() {  
  background(0);
  size(640,340); // Same size as video
  
  // Instantiate Movie object and load video file.
  myVideo = new Movie(this, "transformers.mp4") ; // load Movie  

  // Play the video so that myVideo.available() is true
  myVideo.play();  
}  

void draw() {  

  // get a video frame if available  
  if (myVideo.available()) { 
    myVideo.read(); // read frame
    // Make the video jump to a random frame for each draw frame
    //float time = random(1.0)*myVideo.duration() ; // new random time   
    // Map the mouse position X axis to the length (in time) of the video.
    float time = map(mouseX, 0, width, 0, myVideo.duration());  
    myVideo.jump(time); // jump to timeline position  
  }  

  image(myVideo, 0, 0); // display movie as image  
}
