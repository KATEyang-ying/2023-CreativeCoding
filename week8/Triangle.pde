int numTriangles = 1;

void addTriangles() {
  triangles.clear(); // 清空存储三角形的列表
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      float cellWidth = (width * 0.8 - (numCols + 1) * gutter) / numCols;
      float cellHeight = (height - (numRows + 1) * gutter) / numRows;
      for (int i = 0; i < numTriangles; i++) {
        float x = gutter + col * (cellWidth + gutter);
        float y = gutter + row * (cellHeight + gutter);

        // 随机生成三角形的顶点位置
        float vertexX1 = random(x, x + cellWidth);
        float vertexY1 = random(y, y + cellHeight);
        float vertexX2 = random(x, x + cellWidth);
        float vertexY2 = random(y, y + cellHeight);
        float vertexX3 = random(x, x + cellWidth);
        float vertexY3 = random(y, y + cellHeight);

        Triangle triangle = new Triangle(vertexX1, vertexY1, vertexX2, vertexY2, vertexX3, vertexY3);
        triangles.add(triangle);
      }
    }
  }
}

void drawTriangles() {
  for (Triangle triangle : triangles) {
    triangle.draw();
  }
}

class Triangle {
  float vertexX1;
  float vertexY1;
  float vertexX2;
  float vertexY2;
  float vertexX3;
  float vertexY3;

  Triangle(float vertexX1, float vertexY1, float vertexX2, float vertexY2, float vertexX3, float vertexY3) {
    this.vertexX1 = vertexX1;
    this.vertexY1 = vertexY1;
    this.vertexX2 = vertexX2;
    this.vertexY2 = vertexY2;
    this.vertexX3 = vertexX3;
    this.vertexY3 = vertexY3;
  }

  void draw() {
    fill(0, 255, 0, 100);
    noStroke();
    triangle(vertexX1, vertexY1, vertexX2, vertexY2, vertexX3, vertexY3);
  }
}
