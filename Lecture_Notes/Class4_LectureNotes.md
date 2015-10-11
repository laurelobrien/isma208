#isma 208: class 4, october 5th 2015

##CODING STYLE

Correctly formatted code makes it easier to find bugs and match braces
Java and Processing both accept lines that finish anywhere, including a new line, such as

    i = 20

    ;

but just because it works doesn’t mean it’s readable or elegant code, which should be a goal
Once you start writing longer programs, debugging becomes very difficult because it takes so long visually to find where the error might be

##FOR STATEMENT

for loops have 3 statements you need to make the for loop work:

- expression

- continue condition: it will be true while you want the iteration to keep happening and false otherwise

- iteration: what changes happen to progress the loop

    for (int iteration = 0; iteration < 10; iteration++) {

      //The stuff that gets repeated

      //the local variable iteration stores the iteration number

    }

this loop will add 1 to the variable i until variable i is no longer less than 10, and then the loop will stop

##WHILE STATEMENT

    int iteration = 0;

    while (iteration < 10) {

      //Code to iterate over.

      iteration++;

    }

###EXERCISE & EXAMPLE

Use a for loop to draw a row of 10 small ellipses.

    //initialize variables

    int i;


    //for every iteration, add one to i and perform actions

    //until iteration has been performed 10 times

    for (i = 0; i < 11; i++) {

      noStroke(); //remove stroke


      ellipse(5 + (i * 10), height/2, 10, 10); //draw an 

      ellipse whose origin moves 10px further with each 

      iteration

    }

Now, use a variable to store the number of ellipses so you can change it

    //initialize variables

    int i;

    int ellipseBoundary = 50; //this is the variable that controls # of ellipses drawn

    noStroke(); //remove stroke


    //for every iteration, add one to i and perform actions

    //until iteration has been performed 10 times

    for (i = 0; i < ellipseBoundary; i++) {


        ellipse(5 + (i * 10), height/2, 10, 10); //draw an 

        ellipse whose origin moves 10 px further with each 

        iteration
    }

Finally, make the ellipse diameter dynamic so they always fit in the width of the window

    int i;

    int ellipseBoundary = 50;

    int diam = width / (ellipseBoundary); //diameter of ellipse repeated within ellipseBoundary will fit width perfectly

    int radiusOffset = diam / 2; //ellipse starting position is half its diameter because it's drawn from the center


    noStroke(); //remove stroke


    //for every iteration, add one to i and perform actions

    //until iteration has been performed 10 times

    for (i = 0; i < ellipseBoundary; i++) {

      ellipse(radiusOffset + (i * diam), 50, diam, diam); 

      //draw an ellipse whose origin moves further by its 

      diameter value every iteration, and whose diameter will 

      always fit the row inside the canvas

    }

Because ellipseBoundary, the number of ellipses drawn, can be whatever the user changes it to, the diameter of the ellipse needs to be variable and adapt to the number of ellipses drawn in any instance. The ellipses must fit, edge to edge, the number of times they will be drawn and so their diameters are represented as diam = width/ellipseBoundary;

To make this visually more obvious / fun, change the fill to:

    fill((0 + (i * 20)) % 255); //fill with greyscale colour 

    that becomes lighter with each iteration

##ARRAYS

An array is a container of fixed length that holds a sequence of variables of the same type

Declare an array of ints:

    int[] myArray;

Initialize the array to hold 10 ints:

    myArray = int[10];

They can be declared and initialized at the same time like variables:

    int[10] = myArray;


###array access
You access array elements by their **index**

Assign 10 to the first element of the array:

    myArray[0] = 10;

Access the last element in the array:

    ellipse(myArray[9], 50, 10, 10); //x position of ellipse will be 10th value in myArray[]

If you use an index larger than the length of the array, you get an error

You can use myArray.length to indicate an an integer equal to the number of array items

This is useful if the length of your array is variable, or has been changed throughout the code and you don’t recall or don’t know its current length

   println(myArray.length); //this will print 10 to the console

###exercise & example
Write a program that draws 5 points where the x position of those points are stored in an array.

    //declare and initialize

    int[] drawnPoints = new int[5]; //integer array with 5 empty places


    //for every place in array drawnPoints[], select an index and assign a value depedent 

    //on how many iterations have occurred

    for (int element = 0; element < drawnPoints.length; element++) {

      drawnPoints[element] += element * 10; //assign index in 

      drawnPoints[] the current value of element times 10

    }


    //draw point whose x position is pulled from a specific index's value in drawnPoints[]

    for (int loops = 0; loops < drawnPoints.length; loops++) {

      point(drawnPoints[loops], 10);

    }


The first for-loop selects each empty index in drawnPoints and assigns it a value based on the variable used to count iterations: element. if the loop is on its 3rd iteration, element will have a value of 2 (since it starts at 0). So, the third index of drawnPoints[] is selected (arrays’ first index is also starts at 0), and it is assigned a value of 2 * 10. If you were to “open up” the array and look at its contents when the first for-loop was completed, it would look like this:

    drawnPoints[0] == 0

    drawnPoints[1] == 10

    drawnPoints[2] == 20

    drawnPoints[3] == 30

    drawnPoints[4] == 40

which is all 5 indices accounted for, even though drawnPoints[4] may look like you are only referencing the 4th index out of 5.

##FUNCTIONS
You use functions all the time, like ellipse()

You know it’s a function because it has closed parentheses attached

even fill() and noStroke() are functions, albeit basic ones already defined by Processing

###declare and define a new function

    void circle(int xPosition, int yPosition, int diameter) {

      ellipse(xPosition, yPosition, diameter, diameter);

    }


Use the function in draw:

    void draw() {

      circle(width/2, height/2, 50);

    }


Now you can see that circle() defines the arguments it accepts and where it places those arguments once you provide them. You can reuse it with any arguments you want as many times as you want. Once circle() is defined you can use it instead of 

    ellipse(width/2, height/2, 50, 50);

if you already know you want to draw an ellipse with 2 equal diameters, aka a circle


##USING IMAGES
To use images we use the PImage type:

    PImage myImage; //declare myImage

Use the loadImage() function to initialize:

    myImage = loadImage(“myImage.png”);

Use the “Add File…” function to add your image file to your sketch

Draw your image using the image() function:

    image(myImage, 0, 0); //your image, x position, y position


##PROJECT ONE
###two choices:
1. Subversion: comment / reflect / subvert social or cultural norms and/or expectations using computation
for example, when you make an account on a website, it usually asks for your gender and only offers 2 choices, male or female. this is frustrating and obviously useless for non-binary people. it enforces social norms with limitations and assumptions about the input the user will want to provide.

2. Exploitation: write a program that represents time in a non-traditional way

make a “clock” that visualizes or otherwise computes time in a brand new way, or a way that is not how we normally visualize time (i.e. analog clocks, digital clocks, calendars, linear time etc)


##assessment
- Was the work submitted on time?

- How much has the student’s ability increased?

- How well is the work documented through

  - the project statement? (300 words within the code arguing your choices of topic, concept, and methods to realize that concept)

  - the appropriate use of inline comments?

- Craft (assessed according to code and execution)

  - composition and design

  - effective use of code

- Concept (assessed according to project statement and execution)

  - is the work in scope with the student’s ability?

  - does the work effectively realize the student’s intention? (does it function the way it is meant to?)
