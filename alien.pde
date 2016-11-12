float distance (float ax, float ay, float bx, float by){
  return sqrt(
    (ax - bx) * (ax - bx)
    + (ay - by) * (ay - by)
    );
}


class Ball {
  float x = 0.0;
  float y = 0.0;
  float speedX = 0.0;
  float speedY = 0.0;
  
  float life = 0.0;
  
  int size = 30;

  Ball(float newX, float newY, float newspeedX, float newspeedY) {
    x = newX;
    y = newY;
    speedX = newspeedX;
    speedY = newspeedY;
    
  }

  void RunAway(int mx, int my) {
      float d = distance (mx , my, x, y);
      float force = 1.0;
      
      if (d < 30){
        life = 1.0;
        
        if(mx < x) { speedX = speedX + force; }        
        if(mx > x) { speedX = speedX - force; }       
        if(my < y) { speedY = speedY + force; }        
        if(my > y) { speedY = speedY - force; }
      }
      
      float max = 3.0;
      
      if (speedX > max) { speedX = max; }
      if (speedX < -max) { speedX = -max; }
      if (speedY > max) { speedY = max; }
      if (speedY < -max) { speedY = -max; }
  }
   
   void update(){
      x = x + speedX * life;
      y = y + speedY * life;  
      
      life = life - 0.01;
      if (life < 0) { life = 0; }
      
      if (x > width - size / 2 || x < size / 2) { 
        speedX = -speedX;
      }
      if (y > height - size / 2|| y <  size / 2) { 
        speedY = -speedY;
      } 
   }
   
    void draw() {
      noStroke();
      fill(200, 0, 0);

      ellipse(x, y, size, size);
    }   
}

Ball[] balls= new Ball[100];

void setup() {
  size(600, 600);

  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(
      random(width),
      random(height),
      0,
      0
      );
  }
}

void draw() {
  background(0);  
  
  ellipseMode(CENTER);
  rectMode(CENTER); 

  // body
  noStroke();
  fill(255);
  rect(mouseX, mouseY, 20, 100);

  // head
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY-30, 60, 60); 

  // eyes
  noStroke();
  fill(mouseX/2, 0, mouseY/2); 
  ellipse(mouseX-19, mouseY-30, 16, 32); 
  ellipse(mouseX+19, mouseY-30, 16, 32); 

  // legs
  stroke(255);
  strokeWeight(2);
  line(mouseX-10, mouseY+50, pmouseX-10, pmouseY+70);
  line(mouseX+10, mouseY+50, pmouseX+10, pmouseY+70);
  
  
  for (int i = 0; i < balls.length; i++) {
    balls[i].RunAway(mouseX, mouseY);
    
    for (int j = 0; j < balls.length; j++) {
      if(i != j){
         balls[i].RunAway(
          int(balls[j].x),
          int(balls[j].y)
         );        
      }
    }    
    
    balls[i].update();    
    balls[i].draw();
  }
}