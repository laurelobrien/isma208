#ISMA 208, oct 26th, class 6

#TOP DOWN / BOTTOM UP

##top down
concept formation

visualization

###concept 
the essential idea that drives your choices 

visualization is useful for figuring out how your concept can be realized

sketching how a program will work

determining visual design

###operation 
continues with visualization with more granularity

step by step list of how the program will work

- good opportunity to start writing comments

determines what are the parts of your program and how they relate logically

consideration of interaction, time, inputs, outputs, and processes

- how does time change or not change?

- what variance can you expect in your input?

###modularization
break the logic of the program into individual code blocks, functions, variables etc and write them in code

go back to your visualizations to understand how the parts should relate

use functions so that you don’t copy the same code over and over again

##BOTTOM-UP
build blocks 
debugging 
refinement

###build blocks
write small blocks of code that do things you are interested in exploring

explore how these blocks can be used together

usually bits and scraps from other programs, your own or online, that can stand alone or be plugged with relevant variables easily

###debugging
make sure your code does what it is supposed to do

- comment the intention first to avoid confirmation bias
test your program every time you finish something small and then again when all your blocks are finished

- avoids compounding errors

- it’s easy for early bugs to become hard to solve due to logical errors or typos when things are very abstracted i.e. arrays

###refinement
add niceties that aren’t core to the concept but would still enhance communication / user experience

make sure code is as clean and well-commented as possible

- wrong or misleading comments are worse than no comments

##program design summary
in creative practice, bottom up and top down are often mixed

- change our concept while working on modularization

- having a concept in mind before writing any blocks

top-down is more of an engineering methodology where a program needs to do a very specific job

#IS COMPUTER ART FORMAL OR CONCEPTUAL?
do you need to have a concept for art to be good?

are aesthetics enough to make an amazing artwork?

what is the importance of aesthetic choices?

if concept is all that matters, why make artifacts at all?

#RETURNS
functions can return values to their caller

many functions in Processing return nothing, and that is why the word ‘void’ is used

  void draw() {}

##example
since we have used the modulus operator often to wrap a value, we could replace it with a function

  xPos = (xPos + 1) % 100

typing this over and over is tedious, not self-explanatory in longer expressions, and prone to typos

  int counter = 0;

  int wrap(int value, int increment, int upperLimit) {
    return(value + increment) % upperLimit;
  }

void draw() {
  background(255);
  ellipse(counter, height/2, 30, 30);
  //counter = (counter + 1) % 100;
  counter = wrap(counter, 1, 100);
}

#OBJECT ORIENTED PROGRAMMING
helps you organize pieces of a program in a way that functions aren’t as good at

some key advantages of OOP are:

- they help organize modules of a program

- they separate implementation from interface which makes them very reusable and maintainable

up to this point we have been writing programs procedurally

- procedure is often another word for function in other languages

objects are a combination of functions (methods) and variables (attributes) contained in a single package called an object

methods define the behaviour of an object

attributes define the state of an object

classes are specifications for objects

##instance vs class
all bicycles have 2 wheels in their frame: class of bicycle

my specific bicycle is a concrete thing, it is a particular instance of bicycle

defining a class is like creating a new type (like array)

a class is a specification for an object, a blueprint

an instance is a particular occurrence of an object as a variable is like an instance of a type

  //myInt is like an instance of int
  int myInt;

instances have the same methods and variables, but the contents of those variables are different

  myBike;
  yourBike;

myBike and yourBike have the same variables, such as a colour, but they each have different colours

##array objects
  int[] myArray = new int[100];

int[] is the type, myArray is the name, and “new” tells the computer to create a new instance with 100 elements

instances contain variables (attributes) and we can access them using “dot notation”:

  println(myArray.length);

length is the name of the variable inside the myArray instance

##class definition
looks very similar to a function definition

  class myClass {
    //class attributes (variables)
    //constructor, similar to setup
    myClass () {
    }
    //class methods
    void myMethod() {
    }
  }
the constructor doesn’t return anything but you can’t write void, it internally returns a copy of itself

methods always requires a return type, even if it’s void

##using a class
  //declare variable of type circleClass
  circleClass myCircle;

  void setup() {
    //initialize myCircle with new instance of circleClass
    myCircle = new circleClass(wdth/2, height/2);
  }

  void draw() {
    //tell instance to draw itself
    myCircle.render();
  }

##arrays of instances
  //declare an array for 10 instances of circleClass.
  circleClass[] myCircles = new circleClass[10];
  
  void setup() {
    //initialize 10 instances of circleClass,
    //assign them to elements of the array
    for (int circleIndex = 0; circleIndex < myCircles.length; circleIndex ++) {
      myCircles[circleIndex] = new circleClass(int(random(width)), int(random(height)));
    }
  }

#PROJECT 2
two choices:
- write an image viewer for public space
- write a program that explores non-geometric aesthetics (recommended non-linear math)
  should not look obviously computer generated

###help for project 1:
create a linear array that stores the number of cells in a container e.g. secondCoords[59]

use a nested for loop to loop through the array and assign each grid cell in “physical” space to an index

change the colour by testing if the index if equal to second()

  i.e. at 14 seconds, every rectangle drawn by index 0-14 should have its fill changed to something that represents “filled”
  #pythonic pseudo code
  if coordinates[item] <= second():
    cellFill = true #or fill(colourHere);
  else:
    cellFill = false #or fill(neutralGrey);

  for coordinates[item] <= second():
    fill(colourHere);

i = columns

j = rows

———————————
| 0  | 1  | 2  | 3   | 4   | 5   |
———————————
| 7  | 8  | 9  | 10 | 11 | 12 |
———————————

  for (int i = 0; i < second(); i ++) {
    for int j = 0; j < seconds; j ++) {
      secondCoords[j] = 
    }
  }


