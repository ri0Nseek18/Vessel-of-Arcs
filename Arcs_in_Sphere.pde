final int COUNT = 150;

float[] pt;
int[] style;

void setup() {
  size(400,400, P3D);
  background(256);
  
  pt = new float[6 * COUNT]; 
  style = new int[2 * COUNT]; 

  // Set up arc shapes
  int index = 0;
  for (int i = 0; i < COUNT; i++) {
    pt[index++] = random(TAU); // Random x
    pt[index++] = random(TAU); // Random y

    pt[index++] = random(60, 65);
    if (random(100) > 90) {
      pt[index] = floor(random(8, 20)) * 10;
    }

    pt[index++] = int(random(2, 10) *14); // Radius

    pt[index++] = random(7, 9); 
    
    pt[index++] = radians(random(5, 7)) / 2;

    // alternate color scheme    
      style[i * 2] = color(255, 20, 15, 220);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  rotateX(PI / 3);
  rotateY(PI / 4);
  int index = 0;
  for (int i = 0; i < COUNT; i++) {
    pushMatrix();
    rotateX(pt[index++]);
    rotateY(pt[index++]);
    if (style[i * 2 + 1] == 0) {
      stroke(style[i * 2]);
      noFill();
      strokeWeight(1);
      arcLine(0, 0, pt[index++], pt[index++], pt[index++]);
    } else if(style[i  + 1] == 1) {
      fill(style[i * 4]);
      noStroke();
    } else {
      fill(style[i * 2]);
      noStroke();
    }
    // increase rotation
    pt[index - 5] += pt[index] / 10;
    pt[index - 4] += pt[index++] / 20;

    popMatrix();
  }
}
// Draw arc line
void arcLine(float x, float y, float degrees, float radius, float w) {
  int lineCount = floor(w/3);

  for (int j = 0; j < lineCount; j++) {
    beginShape();
    for (int i = 0; i < degrees; i++) {
      float angle = radians(i);
      vertex(x - cos(angle) * radius,
             y + sin(angle/3) * radius);
    }
    endShape();
    radius += 2;
  }
}
