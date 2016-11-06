void setup(){
  size(400, 400);
}

  int x = 0;
  float speed = 50;  
  
void draw(){
  fill(0, 0, 0, 45);
  rect(0, 0, width, height);

  fill(255, 0, 0);
  ellipseMode(CENTER);
  
  int n = mouseY / 10;
  
  for(int i = 0; i < n; i = i + 1){ 
    float mod = i * mouseX / 100.0;
    float circlePositionX = sin(x / speed + mod) * width / 2 + width / 2;
    float circlePositionY = height / n / 2;
    circlePositionY = circlePositionY + (height / n) * i;
    
    fill(255, 0, 0);
    noStroke();
    ellipse(circlePositionX, circlePositionY, 20, 20);
    
    fill(0, 0,255);
    noStroke();
    ellipse(width - circlePositionX, circlePositionY, 20, 20);
    
    //stroke(255);
    //line(circlePositionX, circlePositionY, width - circlePositionX, circlePositionY);
  }
  x= x + 1;
}