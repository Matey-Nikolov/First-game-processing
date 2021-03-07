//Ball X,Y and COLOR
float[] X = new float[30];
float[] Y = new float[30];
color[] C = new color[30];

float speed = .8;
float ballsize = 15;

//Bar
float barheight = 5;
float barwidth = 20;
float barsize = 50;
float Xbar = 0;
float Ybar = 0;

void setup() {
  size(300, 600);
  smooth();
  noStroke();

  for (int i = 0; i < X.length; i++) {                    //Initialisation of Balls
    X[i] = random(0, width);
    Y[i] = random(0, height-height*.5);
    C[i] = color(random(255), random(255), random(255));
  }

  Xbar = width/2;                                        //Start up coordination of Bar
  Ybar = height-barsize/2;
}

void draw() {
  background(255); 

  ballmove();
  balldraw();

  movebar();
  drawbar();

  hit();

  score();
}

void ballmove() {                            //Move  All Balls
  for (int i = 0; i < X.length; i++) {
    Y[i] = Y[i] + speed;
  }
}

void balldraw() {                          //Draw All Balls
  ellipseMode(CENTER);   
  noStroke();
  for (int i = 0; i < X.length; i++) {
    fill(C[i]);

    ellipse(X[i], Y[i], ballsize, ballsize);
  }
}

void movebar() {                      //Horizontal Move Bar
  if (keyPressed) {
    if (key == 'a') {
      Xbar--;
    }
    if (key == 'd') {
      Xbar ++;
    }
  }
  Xbar = constrain(Xbar, barsize/2, width-barsize/2);
}

void drawbar() {                            //Draw Bar
  rectMode(CENTER);
  fill(color(100, 40, 40));
  rect(Xbar, Ybar, barsize, barsize/4);
}

void hit() {                              //Check for Bar and All Balls Hit4
  for (int i = 0; i < X.length; i++) {
    if ((X[i] > Xbar-barsize/2)&&(X[i] < Xbar+barsize/2 )&&(Y[i] > Ybar-barsize/4)&&(Y[i] < Ybar+barsize/4)) {
      C[i]=color(255);
    }
  }
}

void score() {                //Calculating and printing the Score 
  int score =0;
  for (int i=0; i<X.length; i++ ) {
    if (C[i]== color(255)) {  
      score++;
    }
  }

  textSize(32);
  text(score, width/2, height/2);
}
