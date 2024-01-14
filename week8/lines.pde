int numLines = 1;
float weight = 1;

void addLines() {
  lines.clear(); // 清空存储直线的列表

  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      for (int i = 0; i < numLines; i++) {
        float cellWidth = (width * 0.8 - (numCols + 1) * gutter) / numCols;
        float cellHeight = (height - (numRows + 1) * gutter) / numRows;

        float startX, startY, endX, endY;

        // 50%的概率起点和终点的x坐标相同而y坐标不同
        if (random(1) < 0.5) {
          startX = random(gutter + col * (cellWidth + gutter), gutter + (col + 1) * (cellWidth + gutter));
          endX = startX;
          startY = random(gutter + row * (cellHeight + gutter), gutter + (row + 1) * (cellHeight + gutter));
          endY = random(gutter + row * (cellHeight + gutter), gutter + (row + 1) * (cellHeight + gutter));
        }
        // 另外50%的概率起点和终点的y坐标相同而x坐标不同
        else {
          startX = random(gutter + col * (cellWidth + gutter), gutter + (col + 1) * (cellWidth + gutter));
          endX = random(gutter + col * (cellWidth + gutter), gutter + (col + 1) * (cellWidth + gutter));
          startY = random(gutter + row * (cellHeight + gutter), gutter + (row + 1) * (cellHeight + gutter));
          endY = startY;
        }

        // 随机直线长度
        float lineLength = dist(startX, startY, endX, endY);

        Line line = new Line(startX, startY, endX, endY, lineLength); // 创建直线对象
        lines.add(line); // 将直线对象添加到列表中
      }
    }
  }
}

void drawLines() {
  for (Line line : lines) {
    line.draw(); // 调用直线对象的绘制方法
  }
}

class Line {
  float startX;
  float startY;
  float endX;
  float endY;
  float length;
  
  Line(float startX, float startY, float endX, float endY, float length) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.length = length;
  }
  
  void draw() {
    stroke(255); // 设置直线颜色为白色
    strokeWeight(weight);
    
    line(startX, startY, endX, endY);
  }
}
