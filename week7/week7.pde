ArrayList<Snowflake> snowflakes = new ArrayList<Snowflake>(); // 存储所有的雪花对象

void setup() {
  size(800, 600);
  background(0);
}

void draw() {
  background(0); // 清空画布

  // 绘制所有的雪花
  for (int i = 0; i < snowflakes.size(); i++) {
    snowflakes.get(i).update();
    snowflakes.get(i).draw();
  }
}

void mouseClicked() {
  // 生成随机的正三角形的边长
  float sideLength = random(50, 200);

  // 计算正三角形的高度
  float height = sideLength * sqrt(3) / 2;

  // 将鼠标点击位置设置为图形的中心点坐标
  float centerX = mouseX;
  float centerY = mouseY;

  // 创建一个新的雪花对象，并将其添加到 snowflakes 列表中
  Snowflake snowflake = new Snowflake(centerX, centerY, sideLength, height);
  snowflakes.add(snowflake);
}
