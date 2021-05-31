# Slow down

![final6compressed](https://user-images.githubusercontent.com/61503490/120151416-49901c80-c1fd-11eb-841e-70bbb31c6a61.gif)

For this assignment, I wanted to experiment with poster art and the recent trend of retro-futuristic graphics. My first inspiration was the Space Oddity project by Ak Kao, who made monotone and animated, scientific-like posters. (link; [https://www.behance.net/gallery/51249217/Space-Oddity](https://www.behance.net/gallery/51249217/Space-Oddity))

In trying to find more information on how to actually code something like this, I stumbled upon Tim Rodenbroker's website, which featured a number of Processing art tutorials.  One of them was about using the sinus wave to generate rhythmic animations (link; [https://timrodenbroeker.de/processing-tutorial-waves-pt-1/](https://timrodenbroeker.de/processing-tutorial-waves-pt-1/)). I thought it's fascinating how math can have direct implications in design.

So I started my project by developing Tim's line of code ```float wave = sin(radians(frameCount))```. I started with creating a basic grid of dots, which I thought of elaborating into a to  a flag-like moving pattern. I quickly realized I did not have enough skill to make this possible. Instead, I tried to  gain access to each column of the grid, as to adjust its movement and speed. By using an ```if( )``` statement (that  calculated the placement of the row by dividing the width of the canvas) I applied the ```wave``` variable to the movement of each column. To make it more interesting, I adjusted the x-axis of the circles by either adding, or subtracting the ```wave``` variable.

After this pivotal moment, I continued experimenting with adding the ```wave``` variable by applying it to every possible parameter, whether size or color. The result was a cohesive composition where everything was synched. This gave an impression of an "on/off" state (which can be noticed in the horizontal black line which lights up every now and then). I realized mid-way in the working process that the pattern was somewhat hypnotic and relaxing. From this came an idea of framing the project in a mindful/meditative concept. I think this goal was achieved as the overall composition is balanced, with interesting versions of the animation happening in both left, right, and center parts of the canvas. 

  

To stay authentic to my exploration of the retro-futuristic theme, I applied a grain effect in Figma, and drew a calligraphy-style title in procreate, which then came all together in Keynote (as this is the only tool that allows to export projects in GIF format).
