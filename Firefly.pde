import processing.sound.*;
SoundFile menuMusic,StageMusic,beastiaryMusic, music;




//For Main Menu
boolean mainMenu = false; //Main menu activation
boolean movetolvl =false;
boolean stageload = false ; 
boolean bestiary = false; 
boolean gameover = false; 
int gametimer, countUp, timerStart, timeRem, spawntimer;
PImage img;
String scoreText;


//For beastiary
PImage tearsImg, mushroomsImg, spiderImg;
int beastScore;
boolean beastBG = false;
Mushroom mushroom;
knight knight;

//For Game Stages
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
  mainMenu=true;
  background(0);
  size(1280, 720);  
  img = loadImage("BroodingMawlek.png");
  frameRate(60);
  
   
  
   Bug1s = new ArrayList < Bug1 > ();
   Bug1s.add(new Bug1(10));
   
   interval = 3000;
   
  //for bestiary
  mushroom = new Mushroom();
  knight = new knight();
 
   music = new SoundFile(this, "Stage.mp3");
   music.loop();

  
  
}

void draw()
{
   
   mainmenu();
   lvlSelect();
   bestiary();
   stage();
   gameover();
   



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
    textSize(30);
    text("Bestiary", 20, 400);
    pop();
    
    push();
    textSize(30);
    text("Quit", 20, 500);
    pop();
    
    push();
    image(img, 600, 300);
    pop();
    
     if (mousePressed && 285<mouseY && mouseY<305 && 15<mouseX && mouseX<200) {
        
        movetolvl=true;
        mainMenu = false;
    }
    
     if (mousePressed && 385<mouseY && mouseY<405 && 15<mouseX && mouseX<200) {
        
        bestiary=true;
        mainMenu = false;
    }
    
     if (mousePressed && 485<mouseY && mouseY<505 && 15<mouseX && mouseX<200) {
        
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
    textSize(30);
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
    

    
    
     if (mousePressed && 285<mouseY && mouseY<305 && 550<mouseX && mouseX<700 ) {
        
        movetolvl=false;
        stageLVL = 1;
        score = 0;
        gametimer = 60;
        countUp = 0;
        timerStart = millis() / 1000;
        stageload = true;
        
    }
    
     if (mousePressed && 385<mouseY && mouseY<405 && 550<mouseX && mouseX<700) {
        
        movetolvl=false;
        stageLVL = 2;
        score = 0;
        countUp = 0;
        gametimer = 45;
        timerStart = millis() / 1000;
        stageload = true;
        
    }
    
     if (mousePressed && 485<mouseY && mouseY<505 && 550<mouseX && mouseX<700) {
        
        movetolvl=false;
        stageLVL = 3;
        score = 0;
        countUp = 0;
        gametimer = 30;
        timerStart = millis() / 1000;
        stageload = true;
        
    }
      if (mousePressed && 585<mouseY && mouseY<605 && 550<mouseX && mouseX<700) {
        
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
        
      }
      if(stageLVL ==2)
      {
        c1r = 50;
    
      }
       if(stageLVL ==3)
      {
        c1r = 25;
      }
      
        
        
        
      
      
        c1x = mouseX;
        c1y = mouseY;
        background(0);
        
        
         //timer to add the bug to the arraylist
        if (millis() - spawntimer >= interval) {
            Bug1s.add(new Bug1(bug1R));
            spawntimer = millis();
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
              beastScore +=1;
            }
            
          }
          else {
            //bug will return to black
            Bug1.changeBack();
          
          }
            
       if(key == 'r')
       {
         if(music.isPlaying())
         {
           music.pause();
         }
         else
         {
           music.loop();
         }

       }
  
        countUp = int(millis()/ 1000 - timerStart);
        timeRem = int (gametimer - countUp);
    
        //diplaying score
        pushMatrix();
        fill(255);
        textSize(32);
        text(score, 1200, 600);
        popMatrix();
        
       
            popMatrix();
        
      }
    
       
        push();
        fill(255);
        textSize(14);
        text("Timer: " + timeRem, 22, 40);
        pop();
        
        if(timeRem <=0)
        {
          stageload = false;
          gameover =true;
          gameover();
          
        }
        
        
     
        
    push();
    textSize(25);
    text("R:turn off Music", 22, 700);
    pop();
       
  
     
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

void bestiary()
{
  
  if(bestiary)
  {
    
    if(beastBG ==false){
    background(0);
    }
    
    push();
    textSize(30);
    text("Hollow Knight", 1000, 300);
    pop();
    
    if(beastScore<1)
    { 
    push();
    textSize(30);
    text("?????", 1000, 400);
    pop();
    }
    else
    {
    push();
    textSize(30);
    text("Mushroom", 1000, 400);
    pop();
    }
 
 
    if(beastScore<5)
    { 
    push();
    textSize(30);
    text("?????", 1000, 500);
    pop();
    }
    else
    {
    push();
    textSize(30);
    text("Brooding Mawlek", 1000, 500);
    pop();
    }
    
    push();
    textSize(30);
    text("Back", 1000, 700);
    pop();
    

    
    
      if (mousePressed && 285<mouseY && mouseY<315 && 950<mouseX && mouseX<1200 ) {
        tearsImg = loadImage("Tears.png");
        tearsImg.resize(1280, 720);
        background(tearsImg);
        beastBG =true;
        textSize(14); 
        push();
        text("The Knight is a resident of the City of Tears.\nHe acts as the guardian of the city, \ndefending those who are in need. \nThe knight weilds a weapon called a nail, \nand paired along side his cloak, the \nknight is a fierce foe.", 30, 300);

        knight.display();
        pop();
        
      }
    
      if (mousePressed && 385<mouseY && mouseY<415 &&950<mouseX && mouseX<1200 && beastScore >=1) {
        mushroomsImg = loadImage("Fungals.jpg");
        mushroomsImg.resize(1280, 720);
        background(mushroomsImg);
        beastBG=true;
        textSize(14); 
        push();
        text("The Mushroom soldier of one of the varying \nfungi residents that exist in this area. \nThey are responsible for repopulation \nof areas in the Fungal Wastes.  ",30, 300);  
        mushroom.display();
        pop();
       
      }
      
      if (mousePressed && 485<mouseY && mouseY<515 &&950<mouseX && mouseX<1200 && beastScore >=2) {
        spiderImg = loadImage("spiderDen.jpg");
        spiderImg.resize(1280, 720);
        background(spiderImg);
        beastBG=true;
        textSize(14); 
        push();
        text("Ferocious but extremely social creature.\nBecomes aggressive if not able to mingle with its own kind.  ",30, 300);  
        image(img, 500, 300);
        pop();
       
      }
    
    
      if (mousePressed && 685<mouseY && mouseY<705 && 950<mouseX && mouseX<1200) {
        
        bestiary=false;
        mainMenu =true;
        beastBG=false;
    }
    
    
  }
  
  
  
}

void gameover() {
  
  if(gameover)
  {
    //make black screen 
    pushMatrix();
    fill(0);
    rect(0, 0, 1280, 720);
    popMatrix();

    pushMatrix();
    fill(255);
    textSize(42);
    text("GAME OVER", width / 2 - 150, height / 2);
    scoreText = "Score=" + score;
    text(scoreText, width / 2 - 150, height / 2 + 50);
    text("Press v to save picture", width / 2 - 150, height / 2 + 100);
    text("Press b to view beastiary", width / 2 - 150, height / 2 + 200);
    
     if(key == 'v')
       {
         save("Score.jpg");

       }
    if(key == 'b')
       {
         bestiary =true;  
         gameover=false;
       

       }
    popMatrix();
  }

}
