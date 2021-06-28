In creating a game for both Arduino and Processing, I have thought of setting up a small canvas that would blink with RGB colors. When the user would press a button on Arduino, the colors would stop, and the last color that appeared would light up an LED.
This idea did not work, as I had troubles in Processing with having different colored backgrounds blink on the screen. This issue took most of my time, and to submit a working project, I decided to simplify the game.

The new, and current, game, consists of the following; a user has a target on the screen, and a circle that moves with their mouse. Their goal is to line up the circle with the target and click the mouse. When this happens, an LED on the Arduino will light up.
This simplified idea was not without difficulties; the main challenge was connecting Arduino with Processing. For a long time when coding, I could see the RX adn TX buttons light up when the conditions have been fulfilled in Processing, but the LED on Arduino would not turn on. I had to revisit numerous times how to work with ```Serial.available``` and ```Serial.read```. Finally, I was able to send from Processing an integer to Arduino when the mouse was pressed in the target; if Arduino receives 1, then the LED has to light up.

Here is a video of my project working;
