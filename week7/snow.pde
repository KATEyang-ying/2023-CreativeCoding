// 雪花类
class Snowflake {
  float centerX, centerY; // 中心点坐标
  float sideLength, height; // 边长和高度
  color fillColor; // 填充颜色
  float angle; // 雪花旋转角度
  float rotationSpeed; // 雪花旋转速度

  // 构造函数
  Snowflake(float centerX, float centerY, float sideLength, float height) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.sideLength = sideLength;
    this.height = height;
    this.fillColor = color(0, random(0, 255), 250, random(150, 255)); // 生成随机的填充颜色
    this.angle = 0;
    this.rotationSpeed = random(-0.05, 0.05); // 生成随机的旋转速度
  }

  // 更新雪花状态
  void update() {
    angle += rotationSpeed; // 更新旋转角度
  }

  // 绘制雪花
  void draw() {
    pushMatrix(); // 保存当前坐标系状态
    translate(centerX, centerY); // 将坐标系原点移动到雪花的中心点
    rotate(angle); // 根据旋转角度旋转坐标系

    float x1 = 0;
    float y1 = -height / 2;

    float x2 = -sideLength / 2;
    float y2 = height / 2;

    float x3 = sideLength / 2;
    float y3 = height / 2;
    float times=random(3, 8);
    noStroke(); // 取消绘制轮廓线
    fill(fillColor); // 使用固定的填充颜色
    // 绘制封闭图形
    beginShape();
    koch(x2, y2, x1, y1, int(times));
    koch(x1, y1, x3, y3, int(times));
    koch(x3, y3, x2, y2, int(times));
    endShape(CLOSE);

    popMatrix(); // 恢复之前保存的坐标系状态
  }

  // 递归绘制科赫曲线雪花
  void koch(float x1, float y1, float x2, float y2, int n) {
    if (n == 0) {
      line(x1, y1, x2, y2);
    }
    else {
      float deltaX = x2 - x1;
      float deltaY = y2 - y1;
      float dist = sqrt(pow(deltaX, 2) + pow(deltaY, 2));
      float unit = dist / 3.0;
      float angle = atan2(deltaY, deltaX);

      float xA = x1 + deltaX / 3.0;
      float yA = y1 + deltaY / 3.0;

      float xC =x1 + 2.0 * deltaX / 3.0;
      float yC = y1 + 2.0 * deltaY / 3.0;

      float xB = xA + cos(angle - radians(60)) * unit;
      float yB = yA + sin(angle - radians(60)) * unit;

      vertex(xA, yA); // 添加xA、yA顶点
      koch(x1, y1, xA, yA, n - 1);

      vertex(xB, yB); // 添加xB、yB顶点
      koch(xA, yA, xB, yB, n - 1);

      vertex(xC, yC); // 添加xC、yC顶点
      koch(xB, yB, xC, yC, n - 1);

      vertex(x2, y2); // 添加x2、y2顶点
      koch(xC, yC, x2, y2, n - 1);
    }
  }
}
