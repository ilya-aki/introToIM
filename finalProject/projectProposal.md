# Shake your brain!

My project is a game to practice cognitive skills. As I am interested in the human nature of learning, memorizing and interpreting information, I want to create a useful project that could serve as a foundation for my future ideas in this field.

The overall game encompasses 5 sub-games that take place on the computer screen with Processing, on the breadboard with Arduino, or both. All sub-games are short and somewhat challenging, which practice attention, memory, calculation, and reaction.


----

### Some of the games will be


1. **Playing with colored buttons and LEDs**  
This game will light up a number of LEDs, and then prompt the user to press the buttons of corresponding color of the LEDs that light up 2nd, and pre-last (this practices focus by bringing distraction with unnecessary LEDs lighting up). The user does not now when the LED will stop lighting up..

----

**How it will work**
The program will have a set of LEDs-orders to play, for which it will have the digit answers.

----


2. **Practice perfect pitch** 
By using a proximity sensor or potentiometer, the user will be asked to modify (either by adjusting the distance of their hand, or twisting the knob) the pitch of a sound as so it corresponds to a note on the chromatic scale.

----

**How it will work**  
The program will have a set number of sounds, for which it know the distance/knob positions that correspond to the right pitch. The positions will have a margin ofc.

(but for now we only know how to make arduino play specific notes, not just a continuous sound that modifies with smth, in this case, distance)

----


3. **Paper wind turbine**  
By using a motor which puts in motion a wind turbine (which has 1 colored edge), the user needs to pay attention to how many full rotations the colored edge has accomplished (considering that the motor will spin the turbine in random directions and speeds). The result has to be input on the screen.

----

**How will it work**  
Using 28 Jun’s lecture, the program will randomly assign values for PWMA and AI1/AI2 while also keeping track if the random value at some point resulted in a full rotation. Then the program will need to double check if the user input corresponds to that counter.

----


4. **Listening**

Preferably played with headphones, the user will hear a sound, and will have to indicate through arrow keys, which ear that sound was closer to.

----

**How will it work**  
The program will have loaded sounds (which will already have variations in stereo). It will know what answer corresponds to which sound, and will then compare which key has been pressed to know if the user input is correct.

----


5. **Notice the pixel**  
The user will be presented with a colored or patterned canvas. They will have about 20 seconds to spot a colored dot or item and press on a button of corresponding color.

----

**How will it work**  
Similarly to the listening game, the program will know which button needs to be pressed for which canvas/pattern displayed.
