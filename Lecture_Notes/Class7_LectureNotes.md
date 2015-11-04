#ISMA 208, class 7, nov 2

#DYNAMISM

In a world of increasing stimuli, distraction and solicitation, why the interest in making representations of time more stimulating?

If you’re going to use randomness in your program, do it well and do it intentionally

##LINEAR MAPPING

To take an input and make it applicable for an output range, you may need to change the size and “position”

- Input: 0-100
- Output: 0-50
- Translate 0 to 0 (0+0)
- Scale 100 to 50 (/2)
- input/2 = output

- Input: 10-50
- Output: 20-100
- Translate 20 to 10 (-10)
- Scale 40 to 80 (*2)
- Translate 80 to 100 (+20)

You can use linear mapping in processing to do this automatically

    output = map(input, 0, output, 0);

##LINEAR MOTION

###nonLinearExample on moodle
you can create your own functions that maps a value like output() with modifications regarding how it arrives at that number

sinSmooth() in the moodle example takes a value within an original range of inputs and maps it to an output, but uses a sine wave to arrive there:

    // Smoothing function that uses a sinewave.
    float sinSmooth(float value, float inputMin, float inputMax, float outputMin, float outputMax) {
    
    // Convert input value (ranging from inputMin to inputMax) to pi relative values.
    float piValue = map(value, inputMin, inputMax, -HALF_PI, HALF_PI);
    
    // Calculate smoothed version using a section of a sinwave.
    return ((0.5*(sin(piValue)+1))*(outputMax-outputMin))+outputMin;
    }

##IMAGE MANIPULATION

##image tinting
Setting fill() before drawing images has no effect on the appearance of the changes

To change the colour, use tint():

    tint(0, 255, 0);
    image(myImage, 0, 0);

You can also change the opacity of images

    tiny(255, 127); //full colour, 50% opacity
    image(myImage, 0, 0);

###access pixel values

An image is an array of pixels, you can affect them procedurally or individually

While pixels appear to be in 2D grid, they are actually stored in a 1D structure

“5” is in location 2,1 and location 5 in a 3x3 grid whose “cells” are stored in a linear array

###loop through all pixels

    //convert image data into an array accessible to Processing
    myImage.loadPixels();

    //loop though every pixel column
    for (int x = 0; x < myImage.width; x ++) {
      //loop through every pixel row
      for (int y = 0;; y < myImage.height; y ++) {
        //use the formula to find 1D location
        int index = x + (y * myImage.width);
        //get RGB pixel value
        color pixelColour = myImage.pixels[index];
      }
    }

You can use images as a source of data without every drawing them on-screen (see Class7_E2)

###create image from scratch

    // Initialize new empty image 
    myImage = createImage(100, 100, ARGB); 

    // Convert (empty) image data into array accessible to Processing 
    myImage.loadPixels(); 

    // Loop through all pixels in array 
    for(int i = 0; i < myImage.width*myImage.height; i ++) {
      //set each pixel to a random colour and alpha value
      myImage.pixels[i] = color(random(255), random(255), random(255), random(255));
    }

    //convert pixel array back to image data
    myImage.updatePixels();

###openGL
Old games would use interpolation between pixels to smooth the effect of hard pixel edges

Doing this interpolation linearly cause the block “plus” shapes you see in old games like Doom (see Class7_E3)

###image stretching

see Class7_E4

The image of the caterpillar has been stretched 100X vertically with interpolation between vertical changes in pixels

“Scrolling” through the image vertically creates the effect of scanning, there are slight changes when it transitions between each row of pixels

sinSmooth is applied to the scrolling of the image so it rebounds smoothly and scrolls back the other way

##ARDUINO

###ultrasonic sensors

an ultrasonic distance sensor sends out clicks of sound we can’t hear and measures how long it takes to come back (i.e. echolocation, sonar)

the subtleties of how people are built or behave make this sort of sensing somewhat unreliable

people can move forward while leaning back where the sensor is targeting, they may be too small to be detected well, there may be too much ambient noise in a gallery setting

a big open, empty room with carpet or other dampenings on non-relevant surfaces is ideal

ultrasonic is much longer range than infrared

###arduino device

you can upload programs to an arduino that take arduino’s outputs (which are inputs from an external source usually, such as sound or temperature)

    //import processing libraries to use arduino
    import processing.serial.*;
    import cc.arduino.*

There are arduino libraries so the data arduino collects can be used by Processing or other arduino-compatible languages

Arduino needs to be hooked up to a way of collecting input, it just makes that input useable for us

ECUAD has arduinos you can borrow from the wearable labs and possibly a/v

arduino is open source so you can build your own but you’ll need some electronics know-how and a way to print a circuit board

###firmata
[Firmata](https://www.arduino.cc/en/Reference/Firmata) is a library that implements a protocol for communicating with a host computer.

##FINAL PROJECT

What are you interested in?

Data visualization?

Working with video files?

Sound?

More art examples?

If you’re interested in generative/procedural sound design and soundscapes, Processing is not the language for that

Try PureData, SuperCollider

If you have a good computer you can load an image sequence at a certain FPS
- array of PImages being drawn one after another
- can be looped and appear gif-like

Video files are compressed in a way that doesn’t make each frame accessible, it internally interpolates between frames

