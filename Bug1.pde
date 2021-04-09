class Bug1 extends Bug {

    float xPos = random(width);
    float yPos = 0;
    float speedY = .001;
    float gravity = 0.01;
    float w;
    
    int c = 0;


    Bug1(float tempW) {

        w = tempW;

    }

    void move() {
        speedY = speedY + gravity;
        yPos = yPos + speedY;

    }

    boolean groundCol() {


        if (yPos > height - 20) {

            return true;
        } else
            return false;
    }

    void display() {
        // DisplayPos the circle

        fill(c);

        ellipse(xPos, yPos, w * 2, w * 2);
        
        //trail
        pushMatrix();
        stroke(0);
        line(xPos, yPos, xPos-10,yPos-10);
        noStroke();
        popMatrix();
        
        
    }
    
    void changeColor(){
      
      c = 200;
    }
    
    void changeBack(){
      
      c = 0;
    }
    
}
