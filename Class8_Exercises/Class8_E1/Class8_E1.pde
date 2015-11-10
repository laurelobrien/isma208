import ddf.minim.*;

// Create an variable to hold the minim object.
Minim minim;
// Create a variable to hold a audio player object.
AudioPlayer audioPlayer;
 
void setup() {
  // Instantiate mimim object
  minim = new Minim(this);
 
  // Load an audio file from the data folder into the audio player
  audioPlayer = minim.loadFile("crickets.wav");
}
 
void draw() {
  
  if (mousePressed) {
    // tell the audio player to play the file.
    audioPlayer.play();
  }
  if (keyPressed && key == ' ') {
    // Rewind sound file to the start
    if (audioPlayer.isPlaying()) {
      audioPlayer.pause();
    }
    audioPlayer.rewind();
  }
}
