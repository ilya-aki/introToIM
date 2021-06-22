# Arduino musical instrument

For this assigment, I thought of making a piano-like instrument using the distance sensor.
To make this, I have used the toneMelody example code from Arduino, and adjusted it to work in this project. I used reference code from Sparkfun to set up the distance sensor.

The program first determines the distance at which a hand or object is located, and then plays a corresponding note from the melody[] class. Each item is a note following the chromatic scale.

To add an interesting feature, I have combined the servo and potentiometer to create a metronome, which would help in practicing with this instrument. My initial idea was to use the sound produced by each servo rotation as a beat, which could be adjusted by twisting the knob on the potentiometer. I ran into some issues with the implementation; while the rhythm is set to 4 beats, there is a small delay between each "rotation". The code also does not seem to function together, as having a working metronome does not let the distance sensor to precisely play each note.

