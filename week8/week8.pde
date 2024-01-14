int numRows = 6; // 网格系统的行数
int numCols = 4; // 网格系统的列数
int gutter = 10; // 网格之间的间距
boolean innerRec=false;
boolean innercir=false;
boolean innertri=false;
boolean innerlin=false;
boolean s=false;
ArrayList<Rectangle> innerRectangles = new ArrayList<>(); // 存储内部矩形的列表
ArrayList<Circle> innerCircles = new ArrayList<>(); // 存储圆形的列表
ArrayList<Triangle> triangles = new ArrayList<>();// 存储三角形的列表
ArrayList<Line> lines = new ArrayList<Line>();// 存储直线的列表

void setup() {
  size(1920, 1080);
  background(255);
  UI();
}

void draw() {
  generateLayout();
  if (innerRec) {
    addInnerRectangles();
    innerRec = false;
  }
  drawInnerRectangles();
  
  if (innercir) {
    addInnerCircles();
    innercir = false;
  }
  drawInnerCircles();
  
  if (innertri) {
    addTriangles();
    innertri = false;
  }
  drawTriangles();
  
  if (innerlin) {
    addLines();
    innerlin = false;
  }
  drawLines();
}


void generateLayout() {
  background(255);
  
  float cellWidth = (width*0.8 - (numCols + 1) * gutter) / numCols;
  float cellHeight = (height - (numRows + 1) * gutter) / numRows;
  
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      float x = gutter + col * (cellWidth + gutter);
      float y = gutter + row * (cellHeight + gutter);          
      drawRectangle(x, y, cellWidth, cellHeight);           
    }
  }
}

void drawRectangle(float x, float y, float width, float height) {
  fill(155);
  noStroke();
  rect(x, y, width, height);
}

void save() {
    String timestamp = year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second();
    String filename = "output-" + timestamp + ".png";
    save(filename); // 将当前画布保存为以时间戳为名称的图像文件
    println("Image saved as " + filename);

}
