# Pop the bubble!

This is a simple game, where the user needs to press buttons of corresponding color to make all bubbles pop on the screen.

### Major problems:
The way Arduino interacts with Processing seems a bit odd, as one press of a buttoon does not delete 1 bubble, but rather, all bubbles of that color present on the screem. 
The game also does not contain any end screen that would indicate to the user if they have won the game.

### Clever and difficult things:
In order to allow each bubble to fall one after the other, the canvas features an invisible line that tracks the position of the bubbles. When the lowest bubble on the screen has crossed that line, then, new bubbles are initiated to fall down.

In terms of difficulties, there are too many of them to develop on each here. A succint list would look like this;
- difficulties with having bubbles fall down one afte the other rather than all together in bulk (resolved thanks to the invisible line)
- make each bubble have its own color, as for a long time the bubbles were falling with a different color at each frame
- establishing proper communication between Arduino and Processing as so Processing keeps on looking for more messages from Arduino even after the 1st press of a button

Video link:
https://drive.google.com/file/d/1A789GwocEisUPAhTfSnfTkOMfy7ylqEB/view?usp=sharing 

Schematic link:
https://user-images.githubusercontent.com/61503490/125188196-f7063f00-e243-11eb-80cc-11d1c38710aa.jpg
