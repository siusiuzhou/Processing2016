int n = 30;
float cx[] = new float[n];
float cy[] = new float[n];
float sx[] = new float[n];
float sy[] = new float[n];

void setup(){
  size(400, 400);
  
   for (int i = 0; i < cx.length; i = i + 1){
   cx[i] = int(random(0, width));
   cy[i] = int(random(0, height));
   
   sx[i] = random(-3.0, 3.0);  
   sy[i] = random(-5.0, 5.0);
   }
}  

float distance (float ax, float ay, float bx, float by){
  float u = (ax - bx);
  float v = (ay - by);
  return sqrt( u * u + v * v);
} 

void draw(){
  background(255, 193, 193);
  
  int p = 20;
  
  for (int i = 0; i < cx.length; i = i + 1){
    float x1 = cx[i];
    float y1 = cy[i];
    noStroke();
    fill(255);
    ellipse(x1, y1, p, p);
    
    cx[i] = cx[i] + sx[i];
    cy[i] = cy[i] + sy[i];
    
    if (cx[i] > width - p / 2 || cx[i] < p / 2) { sx[i] = - sx[i]; }
    if (cy[i] > height - p / 2 || cy[i] < p / 2) { sy[i] = - sy[i]; } 
    
    for (int j = 0; j < cx.length; j = j + 1){
      float x2 = cx[j];
      float y2 = cy[j];
      
      float d = distance(x1, y1, x2, y2);
      if (d <= 100.0){
        stroke((d / 100.0) * 255);
        line(x1, y1, x2, y2);
      }  
    }
  }
}
