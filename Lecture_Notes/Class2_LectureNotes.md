#class 2, september 21st 2015

##VARIABLES AND MEMORY
bytes are a measure of how much space in a computer a piece of information is going to use

variables are names that reference a location of memory

bytes are 8 digits that are 1s or 0s (binary, base 8)

a computer needs to know what type a variable is so it knows how to store

###declaration
tells the computer to reserve a memory location big enough and associate it with a name:

	int x; //Declare variable x

	computer reserves 4 slots (bytes? bits?) for said integer, as indicated by not being a string or float

limited amount of space a variable can take up

	an integer can take up 4 bytes

	an integer can take up space from -2^31 to 2^31-1


##NAMING
you can use any name you want as long as it is not a reserved/special word (syntax)

you can’t put spaces in names

variable names are case sensitive

the choice of variable names is very important for communicating to yourself and others what they mean

‘x’ may not be as good a name as ‘xPos’ or ‘xPosition’

###camelCase 
capitalize every word after the first such as

	camelCaseMakesVariablesReadable

	int useCamelCase; //Declare an integer variable named useCamelCase

camelCase is common in Java and other case-sensitive languages (aka most)

##INITIALIZATION
declaring a variable doesn’t necessarily wipe what was in that memory “slot” previously

confusion of what is stored in a reserved space often visualizes as bugs

initialization sets a variable to its initial value

	xPosition = 90;

**=** is an assignment operator that assigns the value on the right to the name on the left

	90 = variableName; //Does not work

you can combine DECLARATION and INITIALIZATION:

	int xPosition = 90; //xPosition is assigned a value of the integer 90

variables can be reassigned as much as you want

you can print the value of a variable with println(variableNAME);

	println(xPosition); //Will print 90 in the output window

if you try to assign a variable that hasn’t been declared, compiler will usually return error (“could not be found” etc)

	xPosition = 9;

	println(xPosition); //“Cannot find anything named “xPosition”

instead, declare a variable (as an integer) and then assign it (as 9)

	int xPosition;

	xPosition = 9;

	println(xPosition); //prints 9

or declare and initialize/assign at the same time

	int xPosition = 9; //xPosition is now an integer! with a value of 9! so efficient

##VARIABLE TYPES
int - non-decimal number: 0, 3, 12532

	recognized as a variable type due to lack of decimal point and places (2.0 is a float even though it is whole)
float - decimal number: 3.67, 5.3333

	ints are required for pixel-perfect drawing as a pixel cannot be displayed as smaller than 1 whole pixel

	occasionally the process for arriving at an integer requires float operators and processes

boolean - either true or false

char - a single text character: ‘p’ or ‘6’

	single quotes are required to differentiate from a String

String - a sequence of characters: “a string”

	**String** must be capitalized to be recognized as a reserved word

	double quotes are required to differentiate from a char

color - stores a processing colour value

	must be spelled the American way, color, to be recognized as a reserved word

##VARIABLE TYPE ISSUES
**// float <- int**

float myFloat = 6; //ok


**// int <- float**

int myInt = 6.04; //not OK (“cannot convert from float to int”)

**// int <- char OR float <- char OR char <- int**

int myInt = ‘5’; //returns 53 (as an integer), which internally corresponds to that character

float myFloat = ‘5’; //returns 53.0, the same internal correspondence but as a float

char myChar = 5; //returns a character that corresponds with the integer 5, not 53 

	(usually [x] if the font doesn’t have it or it’s abstract)

**println();** is useful for debugging or reminding yourself what a variable currently represents


##OPERATIONS AND PROCEDURE
expressions are a way of combining variables and processes in a logical way

	int myCat = 11*(10-8);

	println(myCat); //prints 22

###operations
+ addition

- subtraction

* multiplication

/ division

% modulus

###precedence (order of operations):
1. ()

2. * / %

3. + -

extraneous parentheses are not a bad thing if you need to be explicit
	also communicates your thought process

##EXPRESSIONS
operations and variables can be mixed

	int myMultiplier = 2;

	println(2 * myMultiplier);

you can reassign a variable used in an expression

	myVar = myVar * myMultiplier;

use parentheses () to force precedence

	myVar = 2 * myMultiplier +1; //myVar is 5

##processing provides some variables
	(such as int and String)

**width** - width of canvas

**height** - height of the canvas

	using width or height to calculate variables and processes means your program will work without knowing

	the explicit height of the canvas, and will work on any canvas size that doesn’t conflict

**mouseX** - x axis position of mouse pointer

**mouseY** - y axis position of mouse pointer

##MOUSE
/* draw a circle in the center of the canvas with a diameter with a diameter equal to the x position of the mouse pointer */

	ellipse(width / 2, width / 2, mouseX, mouseX); //nothing happens

to debug this 

	println(mouseX); //prints 0

the program only ran once at at the start of the program, the mouse position was 0 and a circle with a diameter of 0 doesn’t exist

###continuous mode
we can fix our program by using a special processing command (function) that repeats the same code over and over

	void draw() {

		//ellipse code that didn’t work by itself

		ellipse(width/2, height/2, mouseX, mouseX);

 		println(mouseX);

	}

draw() does not need an argument but the empty parentheses indicate it is a Processing commands

functions/Processing commands that do take arguments go inside those parentheses

void is a shortcut for a type of function return (aka don’t return anything, just draw)

##VARIABLE SCOPE

variables you define *inside* a function cannot be accessed outside that function (local)

variables you define *outside* a function can be accessed anywhere (global)

//draw a circle that increases in diameter by 1 pixel every frame

	void draw() {

  		int mySize = 50;

  		ellipse(width/2, height/2, mySize, mySize);

  		mySize = mySize +1;

	}

this keeps drawing a 51px circle because mySize resets to 50 at the start of the function every time

we need to initialize mySize separately from the function that increments it by 1 with the setup() Processing command

in order to use mySize in multiple functions, we also need to declare it globally, not locally

	int mySize; // Declare globally

	void setup() {

  		mySize = 50; //Initialize

	}

	void draw() {

  		ellipse(width/2, height/2, mySize, mySize);

  		mySize = mySize +1;

	}
the ellipse keeps drawing past the bounds of the canvas forever. if we want to keep it inside a 100px canvas, we need to make it reset once it reaches a diameter of 100

###modulus
modulus (**%**) calculates remainder

	mySize = (mySize + 1) % 100; //mySize can never exceed a value of 100

parentheses used because normally modulus is calculated before addition

##useful processing functions
turn off stroke

	noStroke();

draw a rectangle from corner to corner

	rect(x1, y1, x2, y2);

change how the arguments for ellipse and rect are interpreted

	rectMode(CENTER);

	ellipseMode(CORNER);

change the background colour with no stroke

	background(colourcode);

###ERASING FRAMES
	adding background(); to the beginning of the previous draw() function will lay a background colour over the previous ellipse before drawing a new one, effectively erasing the drawings of the previous run-through of the function

	adding background(); AFTER the ellipse(); will appear to draw nothing because background is drawn on top of each new ellipse: Processing reads code and performs actions in order given







