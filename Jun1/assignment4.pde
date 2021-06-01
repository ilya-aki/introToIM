//Ilya
//Assignment 4
//31.05.2021
//Ver 1

//Setting up the variable for the array
int x = 900;

void setup() {
  size(800, 800);
}

void draw() {
  background(#bbbbbb);
  fill(0);

  //Initializing the array
  int[] canvasWidth = new int[x];

  //Creating the sinus variable
  float wave = sin(radians(frameCount))*800;

  //Creating the white grid (that also serves to place the small circles)
  for (int i = 0; i<900; i+=100) {
    for (int j = 0; j<900; j+=100) {

      //Assigning i to each slot of the array
      canvasWidth[i] = i;
      stroke(255);
      strokeWeight(1);
      line(i, j, i+width, j);
      line(i, j, i, j+height);
      line(i, j, width/2, height/2);
      noStroke();

      //Adjusting movement direction for 1st column of cirles
      if (canvasWidth[i] == 0) {
        circle(i-wave/8, j, 10);
      }

      //Managing the elements in the 2nd column
      if (canvasWidth[i] == 100) {
        //Creating the blue vertically moving rectangles
        fill(0, 0, 255);
        rect(i-5, j+wave/2, 10, wave/5);
        //Adjusting the circles
        fill(255);
        circle(i+wave/8, j, 10);
      }

      //3rd column
      if (canvasWidth[i] == 200) {
        fill(0);
        circle(i-wave/8, j, 10);
      }

      //4th column
      if (canvasWidth[i] == 300) {
        fill(255);
        //The size of the circles in this columns changes with the sinus variable
        circle(i+wave/8, j, 10*(wave/100));
      }

      //5th column
      if (canvasWidth[i] == 400) {
        circle(i-wave/8, j, 10);
      }

      //6th column
      if (canvasWidth[i] == 500) {
        circle(i+wave/8, j, 10);
      }

      //7th collumn
      if (canvasWidth[i] == 600) {
        circle(i+wave/8, j, 10);
      }

      //8th column
      if (canvasWidth[i] == 700) {
        //Creating the black-blue vertical line
        fill(0, 0, wave);
        rect(550, 0, 10, height);
        //Creating the glitch-like horizontal line
        fill(random(wave), random(wave), random(wave));
        rect(0, 550, height, 3);
        //Adjusting the circles
        fill(255);
        circle(i, j+wave/8, 10);
      }

      //9th column
      if (canvasWidth[i] == 800) {
        circle(i-wave/8, j, 10);
      }
    }
  }
}
