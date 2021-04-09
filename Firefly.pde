import processing.sound.*;
SoundFile file;

PImage img;

boolean mainMenu = true; //Main menu activation
boolean movetolvl =false;
boolean stageload = false ; 
boolean bestiary = false; 
int timer;





int stageLVL = 0;
int interval;
int score;


float c1x = 0;      // circle 1 position
float c1y = 0;      // (controlled by mouse)
float c1r = 0;     // radius

float bug1R = 10;

ArrayList < Bug1 > Bug1s;

void setup()
{
  background(0);
  size(1280, 720);  
  img = loadImage("BroodingMawlek.png");
  frameRate(60);
  
   //file = new SoundFile(this, "music.mp3");
   //file.play();
  
   Bug1s = new ArrayList < Bug1 > ();
   Bug1s.add(new Bug1(10));
   
   interval = 3000;
  
}

void draw()
{
   
   mainmenu();
   lvlSelect();
   stage();
   



}

void mainmenu()
{
  if (mainMenu){
    
    background(0);
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
    
     if (mousePressed && 385<mouseY && mouseY<405 && 15<mouseX && mouseX<185) {
        
        bestiary=true;
        mainMenu = false;
    }
    
     if (mousePressed && 485<mouseY && mouseY<505 && 15<mouseX && mouseX<185) {
        
       exit(); 
    }
  }
      
}


void lvlSelect()
{
  if(movetolvl){
    
    background(0);
  
    
    push();
    textSize(30);
    text("Stage1", 550, 300);
    pop();
    
    push();
    textSize(28);
    text("Stage 2", 550, 400);
    pop();
    
    push();
    textSize(30);
    text("Stage 3", 550, 500);
    pop();
    
    push();
    textSize(30);
    text("Back", 550, 600);
    pop();
    

    
    
     if (mousePressed && 285<mouseY && mouseY<305 && 550<mouseX && mouseX<620 ) {
        
        movetolvl=false;
        stageLVL = 1;
        stageload = true;
    }
    
     if (mousePressed && 385<mouseY && mouseY<405 && 550<mouseX && mouseX<620) {
        
        movetolvl=false;
        stageLVL = 2;
        stageload = true;
    }
    
     if (mousePressed && 485<mouseY && mouseY<505 && 550<mouseX && mouseX<620) {
        
        movetolvl=false;
        stageLVL = 3;
        stageload = true;
    }
      if (mousePressed && 585<mouseY && mouseY<605 && 550<mouseX && mouseX<620) {
        
        movetolvl=false;
        mainMenu =true;
    }
  }
   
}

void stage()
{
  
    if(stageload)
    { 
      
      if(stageLVL ==1)
      {
        c1r = 100;
        score = 0;
      }
      if(stageLVL ==2)
      {
        c1r = 50;
        score = 0;
      }
       if(stageLVL ==3)
      {
        c1r = 25;
        score = 0;
      }
      
        c1x = mouseX;
        c1y = mouseY;
        background(0);
        
        
         //timer to add the bug to the arraylist
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
