PImage img;
void setup()
{
  background(0);
  size(1200, 800);  
  img = loadImage("BroodingMawlek.png");
}

void draw()
{
   mainmenu();
   push();
   image(img, 600, 300);
   pop();
}

void mainmenu()
{
    push();
    fill(255);
    textSize(28);
    text("FireFly", 22, 40);
    pop();
    
    push();
    textSize(28);
    text("Created by Danny, Christopher, Navdeep", 22, 780);
    pop();
    
    push();
    textSize(28);
    text("Start Game", 22, 300);
    pop();
    
    push();
    textSize(28);
    text("Bestiery", 22, 400);
    pop();
    
    push();
    textSize(28);
    text("Quit", 22, 500);
    pop();
    
    
}
