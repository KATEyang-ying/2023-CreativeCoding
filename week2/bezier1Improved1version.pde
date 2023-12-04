void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  
   if (frameCount % 2 == 1) {
     // 随机生成曲线的控制点
    PVector[] curve = generateRandomControlPoints();
    // 绘制曲线
    noFill();
    stroke(0);
    bezier(curve[0].x, curve[0].y, curve[1].x, curve[1].y, curve[2].x, curve[2].y, curve[3].x, curve[3].y);
  } else {
    drawRandomLines();
  }

}

PVector[] generateRandomControlPoints() {
  PVector[] curve = new PVector[4];
  for (int i = 0; i < curve.length; i++) {
    float x = random(width);
    float y = random(height);
    curve[i] = new PVector(x, y);
  }
  return curve;
}

void drawRandomLines() {
    float startX = random(width);
    float startY = random(height);
    float endX = random(width);
    float endY = random(height);
    line(startX, startY, endX, endY);
 
}
