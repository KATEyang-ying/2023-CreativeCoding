int cols = 40; // 列数
int rows = 40; // 行数
float cellSize; // 方格大小
boolean[][] grid; // 方格的填充状态

void setup() {
  size(800, 800);
  background(255);
  noStroke(); // 去除边框
  cellSize = width / cols; // 计算方格大小
  grid = new boolean[cols][rows]; // 初始化方格填充状态，默认为false
  modifyState();
  modifyColor();
}


void draw() {
  fillRadomcolor();
  delay(50);
}

void modifyState(){
  // 随机修改少量小方格为 true状态
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (random(1) < 0.005) { // 修改概率为0.005（可以根据需要调整）
        grid[i][j] = true; // 修改为 true
        fillStateNeighbors(i, j); // 修改所在行和列的小方格为黄色
      }
    }
  }
}


void modifyColor() {
  // 随机生成更大的黄色、灰色、蓝色、红色大长方形
  int a = int(random(3, 5)), b = int(random(3, 5));
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (random(1) < 0.006) { // 修改概率为0.006（可以根据需要调整）
        fill(randomColor()); // 随机颜色填充
        rect(i * cellSize, j * cellSize, cellSize * a, cellSize * b); // 绘制随机颜色方格
        for (int x = i; x < i + a&& x < cols; x++) {
          for (int y = j; y < j + b&& y < rows; y++) {
            grid[x][y] = false; // 修改为 false
          }
        }
      }
    }
  }
}
      
    
void fillRadomcolor(){
 for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (grid[x][y]) { // 如果方格是ture
        fill(randomColor()); // 随机颜色填充
        rect(x * cellSize, y * cellSize, cellSize, cellSize); // 绘制随机颜色方格
      }
    }
  }
}

void fillwhite(){
 for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (!grid[x][y]) { // 如果方格被填充
        fill(color(255,255,255)); // 随机颜色填充
        rect(x * cellSize, y * cellSize, cellSize, cellSize); // 绘制随机颜色方格
      }
    }
  }
}

void fillStateNeighbors(int x, int y) {
  // 将所在行和所在列的所有方格填充为黄色
  for (int i = 0; i < cols; i++) {
    grid[i][y] = true;
  }
  for (int j = 0; j < rows; j++) {
    grid[x][j] = true;
  }
}

 // return colorOptions[int(random(colorOptions.length))];
int randomColor() {
  // 随机选择黄色、蓝色、灰色或红色
  int[] colorOptions = { color(255, 255, 0), color(0, 0, 255), color(128), color(255, 0, 0) };
  if(random(1)<0.1) return colorOptions[1];
  if(random(1)<0.1) return colorOptions[2];
  if(random(1)<0.1) return colorOptions[3];
  else if(random(1)<0.6) return colorOptions[0];
  
  return colorOptions[0];
 // return colorOptions[int(random(colorOptions.length))];
}


void mousePressed() {
  background(255); // 清空画布
  setup(); // 重新执行setup()函数，重新生成小方格的填充状态
}
