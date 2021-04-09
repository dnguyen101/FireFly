class Bug1 {

    float xPos = random(width);
    float yPos = 0;
    float speedY = .1;
    float gravity = 0.1;
    float w = 50;
    
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
    }
    
    void changeColor(){
      
      c = 200;
    }
    
    void changeBack(){
      
      c = 0;
    }
    
}
