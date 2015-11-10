#ISMA 208, November 9 2015, Class 8

#AUDIO IN PROCESSING

While a digital image is a spatial array of pixels with colour values, a digital sound is a temporal array of samples with amplitude values

We’ll be using the minim library, included in Processing 2

Play a sound in Processing — playSoundExample on Moodle

  import ddf.minim.*; //import everything from this location
  //create a variable to hold the image
  Minim minim;
  //create a variable to hold an audio player object
  Audioplayer audio;

##create a sound in Processing
An oscillator is an algorithm that generates a repeating set of samples. A sine wave is a popular oscillator

You can re-create any sound with a lot of frequencies of sine waves

An oscillator has a frequency (pitch) and an amplitude (volume)

##other languages for audio
Pure Data
SuperCollider
Max/MSP

#ART

###”Vested”, Don Ritter, 2010
Viewer wears a vest that allows their position to be tracked with a big red button on it

Their view of different city environments changes as they move

The viewer can choose 

###”e-motional response #1” Victoria Scott
“Toronto school” of electronic media art

Books snap shut when you get close to read them

Knowledge seems like something that would be accessible to everyone, but jargon and language and literacy can be a block in acquiring it

Denial of knowledge, politics of knowledge

###”the one-pixel camera”, Dave Kemp, 2014

###”Every Playboy Centrefold, 1988-1997)”, Jason Salavon 1998
Point by point mathematical averaging, no morphing used

Visualizes the average shape, colour composition of a centrefold

Trends become more obvious even though the total image is less decipherable, such as a frame around the edge, probably something like a doorframe or window

#VIDEO

###simple video player
See Class8_E4

  import processing.video.*;

Processing always renders video at the video’s framerate, regardless of frameRate(n) declared in setup or used by default

If you want to change the framerate of the video, you need use a method of the Movie class

###jump through video frame by frame
See Class8_E5

.play() tells the movie file to start the file of decoding the frames
  
  float time = map(mouseX, 0, width, 0, myVideo.duration()); //map horizontal position of mouse to time in myVideo where 0 is the left edge of screen and beginning of video
  myVideo.jump(time); //will jump to a timeline position

#FINAL PROJECT
Due December 7th

One page art statement or design brief that describes the project and its genesis for a general audience

Processing code that uses Object Oriented Programming methods of a scale appropriate for the available time and the 30% contribution to your final grade

10 minute formal presentation of your idea on Nov 23rd in class

###next week
Informal  presentations / discussion of your final project ideas

Data visualization (!!)

