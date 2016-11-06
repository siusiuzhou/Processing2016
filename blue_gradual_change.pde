int x = 0;

void setup(){
  size(600,600);
}

void draw(){
  background(0);
  int w = 600 / 6;
  int h = 600;
  
  noStroke();
  
  int mod = 255 / 6;
  
  int c = int(sin(x / 100.0) * 255 / 2 + 255 / 2);
  
  fill(255 - abs(255 - c), 255, 255);
  rect(0, 0, w, h);
   
  fill(255 - abs(255 - mod - c), 255, 255);
  rect(w, 0, w, h);
  
  fill(255 - abs(255 - mod * 2 - c), 255, 255);
  rect(w * 2, 0, w, h);
  
  fill(255 - abs(255 - mod * 3 - c), 255, 255);
  rect(w * 3, 0, w, h);
  
  fill(255 - abs(255 - mod * 4 - c), 255, 255);
  rect(w * 4, 0, w, h);
  
  fill(255 - abs(255 - mod * 5 - c), 255, 255);
  rect(w * 5, 0, w, h);
  
  x = x + 1;
}