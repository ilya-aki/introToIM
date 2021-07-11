# Friday + Saturday, Jun 2/3

I started off the project by following my first final proposal, which consisted of 5 mini games, all under the scope of cognitive training.

I tried creating a program where 4 LEDs would light up in a random order, and then the user would need to press the button of the pre-last color. I quickly ran into an issue with managing the random colors. As I had 4 more games ahead of me, I decided to continue working on another game to see what could be finished more easily. I constructed the wind turbine game by using the DC motor (video example below). Although the wind turbine was rotating perfectly, I needed to think through how to manipulate as to fit in the rules of the game. 

# Monday, Jun 5

I am realizing now that my strategy is not reliable. In fact, the reason why I first chose to make game with 5 sub-games was to avoid issues that would impact the whole project. If one sub-game would not work, then, I could move on to the next game, and ensure that I will have at least something working for the final.

However, this method does not correspond to my skillset. By spreading thin on 5 mini projects, I could not focus on key issues I was encountering, as I had a number of other mini games to work on. With a tight time constraint, I decided to minimize my project into a simple game that could be guaranteed to work by the deadline.

My new/simplified project is a bubble game, where the user has to press buttons of corresponding color to make bubbles pop. 

I have used Daniel Shifman's videos on classes in Processing as a foundation for my game. I wanted to study closely how he manipulates bubbles on the screen, as to build my project on a working example, which I could look back on in case of issues.

[https://www.youtube.com/watch?v=XwfOVFelLoo](https://www.youtube.com/watch?v=XwfOVFelLoo)

I started off with a code where a random number of bubbles, from 10 to 20, would all fall down the screen at the same time. This was not satisfactory as no more bubble would appear on the screen after the previous one's have left the canvas. To solve that, I decided to work on making bubbles fall one at a time. This would simplify the program, as there would not be an infinite amount of bubbles fall down the screen, but only a randomly predefined number. The user just needs to pop the bubbles as they go down, and the game would finish when there are no more bubbles, rather than when the user hits a certain score.

# Tuesday, Jun 6

The main issue for the day was to have each bubble fall one after the other. At the moment, all 10 to 20 bubbles start falling at the same time. However, I need one bubble to start falling, and after a bit of time, a second one, and then another bubble, and so on. 

I have reached out to a friend to ask for advice. We have implemented an idea with an invisible line which would keep track of each bubble's position.

As my main code is placed in a for() loop (that goes through the entire array of bubbles), I could access each bubble individually. The condition goes as follow;

- Is the current bubble the first one to fall? If yes, let it fall as it should
- Has the previous bubble crossed the line? If so, make the current bubble fall down

This fully solved the issue, and I now have bubbles falling one after the other!

Another issue was on the horizon. My original intention was to have each bubble with its own color. For instance, when the game starts, the first bubble could be blue, the second one red, a third one yellow, etc. However, at the moment, each bubble was falling with changing colors at each frame. This grew into a huge problem that took a lot of time to resolve.

Since each bubble has to have a different color, my logic was: "Each bubble needs to know its color". As each bubble is an instance object from the Bubble class, I thought I needed to make some changes there, to apply colors at the core of the program.

I have tried the following configuration;

```java
//this is inside the Bubble class

Bubble {
	colors[0] = #FF0000; //red
  colors[1] = #0000FF; //blue
  colors[2] = #008080; //green
  colors[3] = #FFFF00; //yellow

	a = random(0, 4);
	if (a == 0) {
	fill(colors[0]);
	}
	if (a == 1) {
	fill(colors[1]);
	}
	if (a == 2) {
	fill(colors[2]);
	}
	if (a == 3) {
	fill(colors[3]);
	}
}
```

This was not working.

To make sure I understood the system properly, I made another, much more simplified program with only 1 bubble, to understand how colors are set up.

In my main code, I did the following:

```java
Bubble [] = bubbles = new Bubble[1];
...  //other code

void setup() {
	bubbles [0] = new Bubble[64];
	...  //other code
}

void draw() {
	...  //code to make bubbles fall
	if bubble reaches the bottom of the screen {
		fill the canvas with new color;
		...  //other code
	}
}

```

My logic was that, for every bubble, the canvas needs to be filled with a new color. I backed up this idea with another simple code where I drew 2 shapes with 2 different colors. Both color were displayed, which made me think that several fill() functions will not disrupt each other, as they affect only what is after them until a new fill has been declared. 

I decided to scale up this example. 

[insert picture].
https://user-images.githubusercontent.com/61503490/125186964-477a9e00-e23e-11eb-99da-8a4469e5aa46.jpg 

I was questioning the way the for() loop was working. I thought that every frame, it goes through the entire array of bubbles (horizontally) , and assigns a new color, which might have been the source of the problem. I needed the for() loop to go through each bubble several times, in a way, vertically, to preserve its color through the entire fall.

At the end, nothing was working. But I knew that each object needed to somehow store a color for itself. It could then be applied every time that bubble was displayed. 

# Wednesday, Jun 7

The issue with colors has been resolved during class! I know understand so much better how values are passed between the program and the class. Now, my code randomly generates colors for each bubble and associates it with each bubble when creating it in the setup().

I can now move on to connecting Processing with Arduino.

# SCHEMATIC

I have already built a circuit with 4 buttons, and prepared the code that showed the status of each button.

Here are the items I needed;

- Create a function that would pop the bubbles when a button is pressed
- Establish a communication between Processing and Arduino
- Coordinate the color of the buttons with the color of the bubbles

I started with the pop function. This had a considerable impact on my program. In fact, all this time I have been storing the bubble objects in an array, which had limited functionality for removing and manipulating the objects. So, I had to transition to an arrayList which would offer me the .remove() function. 

Skipping over some details, I have created the following setup to remove each bubble when a button of the corresponding color has been pressed:

```java
//Removing the bubbles with Arduino buttons:
      // 1 - checking whether the bubble is in the canvas:
      if (b.y >= 1) {
        if (b.y <= height) {

          // 2 - checking which colored button has been pressed:
          if (buttonState.equals("yellow button_")) {
            //println("yellow button pressed");

            // 3 - checking if the color of the button corresponds to the color of the bubble
            if (b.c == -1915548) {      

              // 4 - removing the bubble:
              bubbles.remove(i); 
              println("bubble removed"); 
            }
          }
        }
      }
```

This worked well with mousePressed, however, caused a lot of issues with Arduino. When I was pressing the button, Processing would receive an update on that, and print me that a button is pressed. It would delete the first bubble on the screen, but simply ignore the code further on.

Here is a piece from my brainstorm:

# Saturday, Jun 10

Following Professor's advices, I have focused on the handshaking between Processing and Arduino. In fact, Processing was not sending any information back to Arduino. To remedy that, I have setup a `myPort.write('1');` which, in turn, would light up and LED to confirm that a bubble has been successfully popped. However, this was not resolving the issue.

The button press was continuing to be ignored, and if the first button would have another bubble (of the same color) on the screen at the same time, then just one button press would delete both bubbles, which was even more confusing...

After reaching out to a classmate, I have modified my code in Arduino. In fact, my handshaking was sending information to processing with a `println()` function, which was evidently the cause for all ignored button presses. Now, Processing would properly register all button presses, however, they were not deleting one bubble at a time. 

A new issue arose, where Arduino was sending information (such as "yellow button is pressed") for the whole time that the button is pressed. It kept on sending that signal through the entire time that I was pressing the button, regardless of how quickly I tried to do it. What I needed instead, was to have Arduino simply send one message (yellow button is pressed) whenever I press the button, regardless for how long. I am aware that this has to do with how Arduino reads the digital input, but I unfortunately do not have the time to resolve this issue, and am forced to stop my project on here.
