class Bug2 extends Bug
{
  float xPos , yPos , r;
  float speed;
  int c = 0;
  
  
  Bug2 (){
    xPos = random(height);
    yPos = random(width);
    r = 10;
    speed = random(1, 4);
  }
  void move()
  {
     xPos = xPos + speed;
    yPos = yPos + speed;
    
    if ((xPos > width) || (xPos < 0)) {
      speed = speed * -1;
    }
    if ((yPos > height) || (yPos < 0)) {
      speed = speed * -1;
    }
  }
   void display (){
      //Antenas
      noStroke ();
      fill (c);
      triangle (xPos-10 , yPos-5 , xPos-8 , yPos-20 , xPos-2 , yPos-10);
      triangle (xPos+10 , yPos-5 , xPos+8 , yPos-20 , xPos+2 , yPos-10);
      //Body
      noStroke ();
      fill (c);
      ellipse (xPos , yPos , r+5 , r+20);
      //Wings
      triangle (xPos-25 , yPos , xPos-18 , yPos+5 , xPos-3 , yPos);
      triangle (xPos+5 , yPos , xPos+13 , yPos+5 , xPos+26 , yPos);
      //Mark
      fill (c);
      ellipse (xPos , yPos , r-6 , r-6);
    }
    
    void changeColor(){
      
      c = 155;
    }
    
    void changeBack(){
      
      c = 0;
    }
    
    
    
}
