float cx[] = new float[15];
float cy[] = new float[15];
float sx[] = new float[15];
float sy[] = new float[15];
int r[] = new int[255];
int a[] = new int[255];

void setup(){
  size(400, 400);
  background(0);
  
  for (int i = 0; i < cx.length; i = i + 1){
    cx[i] = int(random(0, width));
    cy[i] = int(random(0, height));
    sx[i] = random(-3.0, 3.0);
    sy[i] = random(-6.0, 6.0);
    r[i] = int(random(0,255));
    a[i] = int(random(0,255));
  }  
}

void draw(){
  background(0);
  
  int j = 0;

  while (j < width) {
    noStroke();
    float distance = abs(mouseX - j);
    fill(distance);
    rect(j, 0, 40, height);
    j += 40;
  }
  
  int p = 30;
  
  for (int i = 0; i < cx.length; i = i + 1){
    float x = cx[i];
    float y = cy[i];
    noStroke();
    fill(r[i], 0, 0, a[i]);
    ellipse(x, y, p, p);
    
    cx[i] = cx[i] + sx[i];
    cy[i] = cy[i] + sy[i];
    
    if (cx[i] > width - p / 2 || cx[i] < p / 2) { sx[i] = - sx[i]; }
  
    if (cy[i] > height - p / 2 || cy[i] < p / 2) { sy[i] = - sy[i]; }
  }
}
