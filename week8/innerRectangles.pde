int numInnerRectangles=1;

void addInnerRectangles() {
  innerRectangles.clear(); // 清空存储内部矩形的列表
  
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      float cellWidth = (width * 0.8 - (numCols + 1) * gutter) / numCols;
      float cellHeight = (height - (numRows + 1) * gutter) / numRows;
      for (int i = 0; i < numInnerRectangles; i++) {
        float innerWidth = random(0.1, 0.9) * cellWidth; // 随机生成内部矩形的宽度
        float innerHeight = random(0.1, 0.9) * cellHeight; // 随机生成内部矩形的高度

        float x = gutter + col * (cellWidth + gutter);
        float y = gutter + row * (cellHeight + gutter);
        float innerX = x + random(0, cellWidth - innerWidth); // 在网格单元内随机选择X位置
        float innerY = y + random(0, cellHeight - innerHeight); // 在网格单元内随机选择Y位置

        Rectangle innerRectangle = new Rectangle(innerX, innerY, innerWidth, innerHeight); // 创建内部矩形对象
        innerRectangles.add(innerRectangle); // 将内部矩形对象添加到列表中
      }
    }
  }
}

void drawInnerRectangles() {
  for (Rectangle innerRectangle : innerRectangles) {
    innerRectangle.draw(); // 调用内部矩形对象的绘制方法
  }
}

class Rectangle {
  float x;
  float y;
  float width;
  float height;
  
  Rectangle(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  
  void draw() {
    fill(255, 0, 0, 100); // 设置内部矩形颜色为红色
    noStroke();
    rect(x, y, width, height);
  }
}
