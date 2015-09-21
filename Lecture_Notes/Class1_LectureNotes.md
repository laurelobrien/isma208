#What is programming?
low-level - what computers understand; machine language
high-level - languages the computer must be taught that provide an interface/language humans can more easily interpret
algorithm - a series of steps, instructions, i.e. crochet
	1960s instructions works “dry wall with a single bullet hole” etc
logo programming - local, temporary memory of its position vs global (need to define position relative to everything else rather than relative to "its" current position)
what’s the relationship between code and math?
	linear algebra
	find an algorithm or mathematical equation that represents your intention

##art slides & examples
###Desmond Paul Henry - 1962 “picture made by drawing machine 1”
	program that is written by arranging gears in an analog computer
	computer that was designed and built for military applications, ballistics

###international symposium of electronic art - still up in VAG
	next thurs by donation

###Harold Cohen’s “AARON” program drawing, San Francisco Museum of Modern Art in 1979
	you can make a computer appear to do creative things
	cohen thought of drawing as a cognitive and tactile thing
	his program dictated how the robot applied tool to paper, low level
	written in LISP

###Roman Verostko, “The Buddha”, plotter drawing with pen and brush, ink on paper, 1993
	illuminated manuscripts, gold leaf
	becomes an art object when treated with more tactile processes (leafing)

###David Rokeby, “Seen” 2002
	how can we make computers make sense of visual imagery
	only things that are moving/not moving are visible

###Rafael Lozano-Hemmer, “Voice Array” 2011
	intercom on one end, bank of lights on the other
	record a message, recording is moved across a physical space and shelved to be added to the ambient soundscape
	light representation of volume (on/off visualizing)

###Jer Thorp, “Wired UK” 2009 “Visualizing a Nation’s DNA”
	diversity of DNA
	one of the more famous art/computer/visualization artists
	visualization - mapping - how does it actually work? What is your method for making the data meaningful/interpretable? *Should* it be understandable?

###Pall Thayer, “Sleep Microcode” 2009
###response to Andy Warhol’s film “Sleep” 1963
	writes code that pose or answer philosophical questions
	when you tell a computer to sleep, it will pause for a set amount of time to allow other processes
	sleep is communicated in seconds - 8 * 60 * 60

##memory
some languages are good at parsing things in time, others work in repeatable loops
a computer reads and writes symbols from/to memory
	you can think of memory as a set of empty boxes
the way data is structured in a computer is different between languages, for example how it interprets integers vs floats; python and java are not transparent about how they interpret floats and integers when they change variable types
low level languages fill boxes in a linear fashion, java might find the right number of boxes anywhere that fits, python does not indicate use of "boxes"

##why processing?
flexible and popular in art and design
cross platform
built on java, similar to c++
many libraries
relatively easy to learn

processing is an IDE - text editor, compiler, debugging tools

##Processing actions and settings
run - takes what’s inside the text editor, compiles it into code your computer can execute, runs the code and displays the result
stop - terminates a running program
new - create a new sketch (project)
open - provides a menu with options to open files from the sketchbook, open an example, or open a sketch from anywhere on your computer
save - saved in a special folder for processing. retrieve with sketch > show sketch folder (cmd k), and copy the entire folder with your project/sketch name as it may create multiple files within it
export - exports current sketch as java applet embedded in an html file

processing works in multiple languages in a way, it can be exported to many languages easily

default drawing is 100px by 100x
origin is in the upper left (instead of lower right, as it is in most math applications)
coordinates run opposite of typical graph, lower numbers higher (top left is is 0,0)
ellipse(75, 25, 12, 12); will draw a 12x12px ellipse that is 25 px across the canvas and 75px down
applet = context in which processing program runs

different shapes have different origin points or logic with which they’re drawn
	you can either draw an ellipse from the middle, or dictate a box within the ellipse is drawn (from the upper left corner)

noStroke(); - 100x100 ellipse exceeds a 100x100 box because of the stroke and antialiasing, the stroke adds pixels
	applies to all stroke-applicable shapes that follow such as
		noStroke();
		ellipse(75, 25, 12, 12);
		ellipse(50, 100, 12, 12);
		ellipse(50, 50, 20, 20);
		//creates 2 ellipses without strokes

##comments
helps 3rd party understand your code that isn’t privy to your planning and thinking process
helps you get back into code you wrote a long time ago and don’t remember the purpose of certain lines or functions
/* multi line comments are good for describing whole programs */
// single line comments are good for quick annotations
readability is important for yourself and peers who may work on it (or grade it ;))
comment before many lines to describe the whole function
comment after a line to annotate a single line that may need explanation/clarifying
	ellipse(10, 10, 5, 5) // Draw a circle

##learning
1. you need to write a lot of code and problem-solve a lot of mistakes and errors to learn a language
2. help > reference
3. look at online examples and tutorials
4. google
5. be invested: think about how you can use code in your projects and why it is appropriate to do so
6. type out code even if the intention is to perfectly copy it, copy and paste teaches almost nothing
7. understand solutions offered online before implementing them

##homework
1. download and install processing on your own computer (use version 2.2.1)
2. do assignment 1
	on moodle under week 2
	due tuesday, 22 september 2015, 9am