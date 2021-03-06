# 🎮 Gamify your essay

## Introduction
On personal experience, I find it hard to enter a state of flow to write my essays. It is often an intimidating process that should not be left for the last minute. This is why I thought of gamification, a known technique that makes work more fun. Taking inspiration from pomodoro study techniques and smart fitness equipment UX (powered by sounds), I want to make a game that would reward the write on the go, as to build a habit to put down words fearlessly.


The game is conceptually simple. The user creates a profile to keep track of their progress. After establishing their goals for the work session, a progress bar will appear on top of a blank screen, where the user has space to write. It can be tempting to start writing "in your head"; first think through the ideas, and only then, type words. Yet this is a dangerous method as your mind can drift off to millions of new ideas that become number one distraction priorities. As to make the work more actionable, the game will produce sounds as the user types on their keyboard. These sounds will be subtle, and will build up into a meditative composition as the writer continues to type more and more. The stimulation to write is given only when the user starts an action, which is the key part in writing.


Before coming to this concept, I explored different ideas in this draft:


Page 1             |  Page 2
:-------------------------:|:-------------------------:
<img width="500" alt="brainstorm_page_1" src= https://user-images.githubusercontent.com/61503490/121135297-6c49b300-c845-11eb-8ce4-89cfec66893f.jpg>  |  <img width="500" alt="brainstorm_page_1" src=https://user-images.githubusercontent.com/61503490/121135382-7ec3ec80-c845-11eb-8a51-196d5579b8ce.jpg>



## Inspiration and links to sounds I used
My primary source of inspiratipn was this podcast from Adobe which explored how smart fitness gear (such as the Apple Watch or Peloton) use subtle and rewarding sounds to keep users push themselves during workouts. Link: https://podcasts.apple.com/ae/podcast/wireframe/id1437677219?i=1000518610349 

For the keyboard sounds, I decided to follow the observations from the podcast, and indeed used the sounds from the Apple Watch;
https://www.youtube.com/watch?v=I0x2D0hGdTY&ab_channel=AppleDatabase 
https://www.youtube.com/watch?v=V5bXSMgu2uo&ab_channel=AppleDatabase
https://www.youtube.com/watch?v=NEkNgxd3cEQ&ab_channel=AppleDatabase

For the soundscape, I used a sample from Endel, which is a renowned app that generates AI-based sounds to keep people focused. Here's the link: https://www.youtube.com/watch?v=Fy9-mskmhQ8


# Daily journal, featuring struggles and moments of joy

## June 8th

I plan to work on my code in a reverse method, meaning, I want to figure out the key and hardest parts first (such as the progress bar and sounds generated by the keyboard), leaving the UI, graphics, and easiest parts last.


## June 10th

I am having difficulties with understanding how sound works. I first tried having Processing just play something without creating any sound classes. I had issues with the file format, and understanding whether my files were correctly placed in the path.
Some tutorials helped me grasp the concept, and following the code from the lecture, it seems that I was able to make sounds play when the keyboard is pressed. The next challenge would be to figure out how to play the meditative song once the user reaches an optimal and consistent typing pace.


## June 11th — 10am

To clarify my goals, I have broken down the code in to small and logical steps:

- When the user starts to type, there will just be one and subtle sound.

- The program needs to count the number of times the keys were pressed. When it reaches a certain number, the user should get notified that they have passed the starting point, and the meditative soundscape is about to play.

- Then, the soundscape starts then.

- In the meantime, the program needs to keep track of how consistently the user is typing. If the user stops typing, after a buffer time, the soundscape shoudl stop. But, how to achieve this? Should I find a ratio between the keyPressed function and the time elapsed?

Here are a few challenges I encountered, and was able to resolve:
1. How do I set up a counter for the keyPressed() function? I need to know how many keys were pressed as to be able to play the soundscape after the starting point.
    *Solution* → I will make a variable, which will be incremented by 1 every time keyPressed() is true (since keypresses is a boolean, I think)

2. I had this code:
````
if (keyPressed == true) {
    println("key was pressed");
    sounds[0].play();
    println("sound played");
    timesKeyPressed =  timesKeyPressed + 1;
    println(timesKeyPressed);
  }
````
And when I ran it, I could hear and see in the terminal that the variable indicating how many times a key has been pressed was not incrementing by 1. Each time I pressed a key, I heard several sounds, as if I pressed more than once (which was not the case). I couldn’t understand why this was happening. 

But then, it struck me that this condition was true while the key was _phisically_ pressed. So, there was a time factor involved; if I kept on having my finger on the key, the sounds and numbers would continue to increment. However what I need is this condition to happen only once, when the key is pressed, regardless for how long is pressed.
  *Solution* → I decided to resolve this by placing the code in ````void keyTyped()````. This is also useful in not including the shift key into the count.
  
  
## Submission comment

I have not been able to finalize this game, as there were many issues I do not know how to solve. 

I have created a separate processing document for creating the homescreen UI as I thought it would be easier to then merge the entire code, just like puzzle pieces. In order to deliver at least some working pieces, I have not merged the code together as the conditions I have created in the homescreen page are not working. In fact, I intended for the page to "refresh" once the user clicks on the corresponding button, however this is not working.

As for the main code, Processing takes time to launch the program. After it is loaded, the user is supposed to start typing, however I have not figured out a way to make an input box for the user to see their text. Once the user typed more than 20 characters, a different sound will play and start the soundscape. This meditative music is supposed to stop playing if the user does not type enough during the following minute (as the goal of the game is to simply overcome a writer's block, and to incentivize the quantity of writing above quality). I thought of implementing this idea by dividing the a variable (tracking the time elapsed after the soundscape started) by 60 (as the function used tracks milliseconds). This condition is not working properly as the soundscape stops playing at incorrect moments.
