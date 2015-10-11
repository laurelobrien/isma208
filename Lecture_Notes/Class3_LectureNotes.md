#isma 208: class 3, september 28th 2015

##assignment extension
*2 day extension for assignment 2 due to moodle downtime*
due thursday 9am, oct 1st

##REVIEW
A variable is a reference to memory

Different variable types are stored in different ways so it’s important to differentiate between them

String values have to be initialized with double quotes so the compiler doesn’t think it’s a variable

    String myString = “This is a string”; //declared and initialized

    String myString = This is a string //error

A local variable is a variable that is only valid within its code block / function

- it cannot be referenced in other code blocks or globally

###what is a function?

functions we have used in class before 

- setup() and draw(): anything with parentheses

- ellipse()

- rectangle()

- things that contain arguments (optionally, sometimes) in brackets that perform pre-built tasks

###basic vs continuous OR static vs active modes
continuous or active mode is engaged when you start using functions that repeat, loop, or run 

continuously such as draw();

- continuous/basic and active/static

##CONDITIONALS
Allow your program to execute code dependent on some condition (“branching”)

- if this statement is true, perform this task(s)

###conditions refer to a state
Conditional operators test the state of variables and return true or false

is 10 greater than 5?
    10 > 5: true
is 10 equal to 100?
    10 == 100: false
is 5 lesser than or equal to 10?
    5 <= 10: true //<= means less than OR equal to, 5 is not equal to but it *is* less than 10

###common operators
    > //greater than
    < //less than
    <= //less than or equal to
    >= //greater than or equal to
    == //equal to
    != //not equal to
  == is used instead of = because = is already used to assign variables. 
  - == is for comparison, = is for assigning and changing value

###challenge & example
Write a program that draws a growing circle whose diameter wraps at 100, but use a conditional instead of a modulus operator to wrap

    int mySize; //declare

    void setup() 
    {
      mySize = 10; //initialize
    }

    void draw() 
      {
        background(128); //erase last frame
        ellipse(width/2, width/2, mySize, mySize); //draw ellipse in centre of screen with variable size
        mySize = mySize + 1 //re-assign mySize as itself plus 1

        if (mySize == 99) {
        mySize = 0; //re-assign mySize as 0 so it starts the cycle over
      }
    }

conditionals are more flexible than modulus in this instance, you can wrap at and between any numbers including negatives

##IF / ELSE STATEMENTS
    if ([condition]) {

      //do this if condition is true

    } else {

     //do this if condition is false

    }

###exercise & example
Write a program that draws an ellipse. If the mouse is on the left side of the canvas, fill with
green. If it’s on the right side, fill with red.

    void draw() 
    {
      background(128); //medium grey, erase last frame
      
      //check if mouse position is less than or greater than the midpoint of the canvas
      if (mouseX < width/2) {
        fill(0, 255, 0);
      } else {
        fill(255, 0, 0);
      }
      
      ellipse(50, 50, 50, 50); //draw ellipse
    }

The fill must be chosen before the ellipse is drawn or the fill won’t be applied to it. 
In this particular case, it would still *appear* to work if ellipse was drawn first because once the fill is set the first time the program runs, it continues to stay turned on until you turn it off.  For the first frame it would not be filled but the framerate is too high to notice the mistake with the naked eye.

##AND / OR
    && //and
    || //or
    ! true // false
    ! false //true
&&, and, means both conditions must be true for the entire condition to return true
||, or, means only one statement has to return true for the entire conditional to return true

Use and/or to compare expressions
    if ((10 > myVar) && (frameCount == 60)) {
      //perform action
    }

###exercise & example
Write a program that changes the background colour according to what quadrant the mouse is in, except for the lower right quadrant, in which case draw a rectangle that fills it. It should work on any size canvas.

    void draw() 
    {
      //check X and Y coordinates of mouse in relation to canvas
      if ((mouseX < width/2) && (mouseY < height/2)) {
        background(255, 0, 0); //red
      } else if ((mouseX < width/2) && (mouseY > height/2)){
        background(0, 0, 255); //blue
      } else if ((mouseX > width/2) && (mouseY < height/2)) {
        background(0, 255, 0); //green
      } else if ((mouseX > width/2) && (mouseY > height/2)) {
        rect(width/2, height/2, width/2 - 1, height/2 - 1); //minus 1 from size arguments to account for default stroke width
      }
    }


##LOOPS
There are 2 main kinds of loops: *for* loops and *while* loops

###for statements
for loops have 3 components

- initialize the loop

- continue loop

- iterate

In the format of

    for (start; end; result/action/iterate) {
      //things
    }

For example, repeat over 10 iterations:

    for (int interation = 0; iteration < 10; iteration ++;) //iteration is increased by 1 until it reaches 9

the second component **iteration < 10** means the loop stops performing **iteration ++;** if iteration is no longer less than 10

###while statements

For example, repeat over 10 iterations:

    int iteration = 0;
    while (iteration < 10) {
      iteration ++; //iteration is increased by 1 until it reaches 9
    }

##RANDOM NUMBER GENERATOR (RNG)
Not *really* random, but close enough
You must have a good reason to use RNG in projects because choices should have a conceptual basis and not be arbitrary
RNG is a good source of variation and material in instances where the original material is not important so much as what is "done" to that material, such as the AARON program

