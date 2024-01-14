int numInnerCircles=1;

void addInnerCircles() {
  innerCircles.clear(); // 清空存储内部圆形的列表
  
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      float cellWidth = (width * 0.8 - (numCols + 1) * gutter) / numCols;
      float cellHeight = (height - (numRows + 1) * gutter) / numRows;
      for (int i = 0; i < numInnerCircles; i++) {
        float innerDiameter = random(0.1, 0.9) * min(cellWidth, cellHeight); // 随机生成内部圆形的直径

        float x = gutter + col * (cellWidth + gutter);
        float y = gutter + row * (cellHeight + gutter);
        float innerRadius = innerDiameter / 2; // 计算内部圆形的半径

        // 在网格单元内随机选择圆心位置
        float minX = x + innerRadius;
        float maxX = x + cellWidth - innerRadius;
        float minY = y + innerRadius;
        float maxY = y + cellHeight - innerRadius;
        float innerX = random(minX, maxX);
        float innerY = random(minY, maxY);

        Circle innerCircle = new Circle(innerX, innerY, innerDiameter); // 创建内部圆形对象
        innerCircles.add(innerCircle); // 将内部圆形对象添加到列表中
      }
    }
  }
}

void drawInnerCircles() {
  for (Circle innerCircle : innerCircles) {
    innerCircle.draw(); // 调用内部圆形对象的绘制方法
  }
}

class Circle {
  float x;
  float y;
  float diameter;
  
  Circle(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }
  
  void draw() {
    fill(0, 0, 255, 100); // 设置内部圆形颜色为蓝色
    noStroke();
    ellipseMode(CENTER);
    ellipse(x, y, diameter, diameter);
  }
}
