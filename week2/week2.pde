/*
WALL DRAWING 1180

Within a four-meter (160”) circle, draw 10,000 black straight lines and 10,000 black not straight lines. All lines are randomly spaced and equally distributed.
August 2005
Marker
Yale University Art Gallery
Gift of the LeWitt Collection, Chester, Connecticut, in honor of Terry and Richard Albright, B.A. 1961
*/


void setup() {
  size(1000, 800);
  background(255);
  stroke(0);
}

void draw() {
  if (frameCount % 2 == 1) {
    drawRandomLines();
  } else {
    drawConcentricCurves();
  }
  
  delay(200);
}


// 在屏幕四处随机画出数量随机且倾斜角度随机的直线
void drawRandomLines() {
  int lineCount = floor(random(10, 30));
  
  for (int i = 0; i < lineCount; i++) {
    float startX = random(width);
    float startY = random(height);
    float endX = random(width);
    float endY = random(height);
    line(startX, startY, endX, endY);
  }
}

// 随机绘制圆形曲线
void drawConcentricCurves() {
  int curveCount = floor(random(10, 30));
  float maxRadius = random(50, 1000);  
  float angleStep = 0.1;
  float centerX = random(width);
  float centerY = random(height);
  
  for (int i = 0; i < curveCount; i++) {
    float radius = map(i, 0, curveCount - 1, 0, maxRadius);
    float prevX = centerX + cos(0) * radius;
    float prevY = centerY + sin(0) * radius;
    
    for (float angle = 0; angle < 2 * PI; angle += angleStep) {
      float x1 = centerX + cos(angle) * radius;
      float y1 = centerY + sin(angle) * radius;
      float x2 = centerX + cos(angle + angleStep) * radius;
      float y2 = centerY + sin(angle + angleStep) * radius;
      curve(x1, y1, prevX, prevY, x2, y2, x2, y2);
      prevX = x2;
      prevY = y2;
    }
  }
}
