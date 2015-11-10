import ddf.minim.*;
import ddf.minim.ugens.*;
 
// Create an variable to hold minim objects.
Minim minim; // Main minim object
AudioOutput output; // audio output object
Oscil wave; // audio signal object
 
void setup() {
  size(500,500);
  
  // Instantiate mimim object
  minim = new Minim(this);
 
  // use the getLineOut method of the Minim object to get an AudioOutput object
  // Set the audio output object to the sound-card output
  output = minim.getLineOut();
 
  // Assign a new sinewave oscillator to wave variable.
  // The wave has a frequency of 440hz and amplitude of 0.5.
  wave = new Oscil( 440, 0.5, Waves.SINE );
  
  // Connect the oscillator to the output so we can hear it.
  wave.patch( output );
}

// We don't draw anything, we only specify get mouse position
// Mouse position is used to change the properties of the oscillator
void draw() {
  // map mouse X position to frequency in hz. 
  float freq = map( mouseX, 0, width, 0, 10000 );
  wave.setFrequency( freq );
  
  // map mouse Y position to volume level. 
  float amp = map( mouseY, 0, height, 1, 0 );
  wave.setAmplitude( amp );
}
