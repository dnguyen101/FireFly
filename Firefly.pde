import processing.sound.*;
SoundFile file;

PImage img, stage1Background;
boolean movetolvl = false;
int timer;

boolean mainMenu = true; //Main menu activation

int interval;
int score = 0;


float c1x = 0;      // circle 1 position
float c1y = 0;      // (controlled by mouse)
float c1r = 100;     // radius

float bug1R = 10;

ArrayList < Bug1 > Bug1s;

void setup()
{
  background(0);
  size(1280, 720);  
  img = loadImage("BroodingMawlek.png");
  frameRate(60);
  
   file = new SoundFile(this, "music.mp3");
   file.play();
  
   Bug1s = new ArrayList < Bug1 > ();
   Bug1s.add(new Bug1(10));
   
   interval = 3000;
  
}

void draw()
{
   mainmenu();
   stage1();
   



}

void mainmenu()
{
  if (mainMenu){
    
    push();
    fill(255);
    textSize(30);
    text("FireFly", 22, 40);
    pop();
    
    push();
    textSize(30);
    text("Created by Danny, Christopher, Navdeep", 22, 700);
    pop();
    
    push();
    textSize(30);
    text("Start Game", 20, 300);
    pop();
    
    push();
    textSize(28);
    text("Bestiery", 20, 400);
    pop();
    
    push();
    textSize(30);
    text("Quit", 20, 500);
    pop();
    
    push();
    image(img, 600, 300);
    pop();
    
     if (mousePressed && 285<mouseY && mouseY<305 && 15<mouseX && mouseX<185) {
        
        movetolvl=true;
        mainMenu = false;
    }
    
  }
      
}

void stage1()
{
  
 
  if(movetolvl)
  { 
    
  
    
    c1x = mouseX;
    c1y = mouseY;
    background(0);
    
    
     //timer to add the coin to the arraylist
    if (millis() - timer >= interval) {
        Bug1s.add(new Bug1(bug1R));
        timer = millis();
    }
    
    //FlashLight Edit this later
    pushMatrix();
    fill(255);
    ellipse(c1x, c1y, c1r*2, c1r*2);
    popMatrix();
    
       //display bugs on screen
    for (int i = Bug1s.size() - 1; i >= 0; i--) {
        Bug1 Bug1 = Bug1s.get(i);
        pushMatrix();
        
        //Bug will display as Black
        Bug1.display();
        Bug1.move();
     
        
        
      // check for collision
      // if hit, change color
      boolean hit = circleCircle(c1x,c1y,c1r, Bug1.xPos, Bug1.yPos, Bug1.w);
      
      if (hit) {
        Bug1.changeColor();
      
        if(mousePressed && hit == true)
        {
          Bug1s.remove(i);
          score +=1;
        }
        
      }
      else {
        //bug will return to black
        Bug1.changeBack();
      
      }
        
        
        popMatrix();
    
  }


    //diplaying score
    pushMatrix();
    fill(255);
    textSize(32);
    text(score, 1200, 600);
    popMatrix();
 
  }
}

boolean circleCircle(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distX = c1x - c2x;
  float distY = c1y - c2y;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distance <= c1r+c2r) {
    return true;
  }
  return false;
}
