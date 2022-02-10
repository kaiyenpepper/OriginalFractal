int myX = 250;
int myY = 250;
int mySiz = 300;
int count = 0;

int myX2 = 0;
int myY2 = 0;
float mySiz1 = 300;
float mySiz2 = 100;
float rot = 0;

public void setup(){
  size(500,500);
  rectMode(CENTER);
}

public void draw(){
  stroke(0);
  strokeWeight(1);
  //circle fractal
  if(count == 0){
    background(#BFA4E5,5);
    myFractal(myX,myY,mySiz);
    if(mousePressed == true){
      myFractal(myX,myY,mySiz);
    }else{
      augment(450);  
    }
  }
  //square fractal
  if(count == 1){
    background(#FAD749);
    myFractal1(myX,myY,mySiz);
    if(mousePressed == true){
      myFractal1(myX,myY,mySiz);
    }else{
      augment(350);  
    }
  }
  //ellipse fractal
  if(count == 2){
    background(#D34076);
    translate(250,250); //ellipse at the center of the screen
    if(mousePressed == true){
      noFill();
      stroke(255);
    }else{
      fill(255);
      stroke(0);
    }
    myFractal2(myX2, myY2, mySiz1, mySiz2);
    augment2(450);
  }
}

public void keyPressed(){
  count++;
  if(count >= 3){
    count = 0;
  }
}

public void myFractal(int x, int y, int siz){
  //draw circle centered at (x,y) of size siz
  ellipse(x,y,siz,siz);
  if(siz > 5){ //if siz <= 20 no recursion (only base rectangle, no smaller rectangle)
    myFractal(x-siz/4, y, siz/2);
    myFractal(x+siz/4, y, siz/2);
    myFractal(x, y-siz/4, siz/2);
    myFractal(x, y+siz/4, siz/2);
  }
}

public void myFractal1(int x, int y, int siz){
  rect(x,y,siz,siz);
  if(siz > 10){
    myFractal1(x,y,siz/2);
    myFractal1(x,y,siz/3);
    myFractal1(x,y,siz/4);
    myFractal1(x,y,siz/5);
    myFractal1(x,y,siz/6);
    myFractal1(x,y,siz/7);
    myFractal1(x,y,siz/8);
    myFractal1(x,y,siz/9);
    myFractal1(x+siz/4,y,siz/2);
    myFractal1(x-siz/4,y,siz/2);
    myFractal1(x,y+siz/3,siz/2);
    myFractal1(x,y-siz/3,siz/2);
  }
}

public void myFractal2(int x, int y, float siz1, float siz2){
  rotate(rot); // rotate function 
  rot+=.0001;
  ellipse(x,y,siz1,siz2);
  if(siz1 > 10){
    myFractal2(x,y,siz1/1.2,siz2/1.2);
  }
}

public void augment(int cap){
  mySiz = mySiz + 2;
  if(mySiz >= cap){
    mySiz = 100;
  }
}

public void augment2(int cap){
  mySiz1+=.3;
  mySiz2+=.1;
  if(mySiz1 >= cap){
    mySiz1 = 120;
    mySiz2 = 40;
  }
}
