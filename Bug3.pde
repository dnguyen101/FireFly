class Bug3 extends Bug
{
  
  float xPos = 0;
  float yPos = random(height);
  float r = 10;  
  float speedX = .001;
  float gravity = 0.01;
  int c = 0;
  
  void move()
  {
    speedX = speedX + gravity;
    xPos = xPos + speedX;
  }
  
  void display()
  {
  pushMatrix();
  fill(c);
  
  ellipse(xPos, yPos, r,r);
  ellipse(xPos, (yPos)-5, r/2,r/2);
  //lower legs
  stroke(0);
  line((xPos)-3, (yPos) +3,xPos-10,yPos+14);
  line((xPos)-3, (yPos) +1,xPos-6,yPos+10);
  line((xPos)+2, (yPos)+3,xPos+10,yPos+14);
  line((xPos)+3, (yPos)+1,xPos+6,yPos+10);
  //upper legs
  line((xPos)-3, (yPos) -3,xPos-11,yPos-14);
  line((xPos)-4, (yPos) -1,xPos-5,yPos-9);
  line((xPos)+3, (yPos)-3,xPos+11,yPos-14);
  line((xPos)+4, (yPos)-1,xPos+5,yPos-9);
  popMatrix();
    
  }
  
  
  
}
