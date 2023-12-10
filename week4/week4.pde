  //img = loadImage("D:/你交课程/大二上/创意编程/作业/week4/5.jpg");  // 加载图像文件
import processing.core.*;

PImage referenceImage;
Particle[] particles;

int numParticles = 30000;
int particleSize = 1;
float gravity = 0.05;
float particleSpeed = 1;
//int frameCount = 0; // 计数器，用于跟踪已保存的帧数

void setup() {
  size(600, 900);
  background(0);
  
  // 加载引用图片
  referenceImage = loadImage("D:/你交课程/大二上/创意编程/作业/week4/3.jpg");
  referenceImage.filter(GRAY); // 转换为灰度图像
   
  
  // 计算缩放比例
  float scale = min((float)width / referenceImage.width, (float)height / referenceImage.height);
  
  // 计算缩放后的宽度和高度
  int scaledWidth = (int)(referenceImage.width * scale);
  int scaledHeight = (int)(referenceImage.height * scale);
  
  // 等比例缩放图片
  referenceImage.resize(scaledWidth, scaledHeight);
  referenceImage.filter(THRESHOLD, 0.5); // 转换为二值图像
  
  // 初始化粒子数组
  particles = new Particle[numParticles];
  for (int i = 0; i < numParticles; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  background(0);
  // 更新和绘制粒子
  for (int i = 0; i < numParticles; i++) {
    particles[i].update();
    particles[i].display();
  }
  
  // 判断粒子是否已经形成整个人脸轮廓
  boolean allParticlesInPosition = true;
  for (int i = 0; i < numParticles; i++) {
    if (!particles[i].inPosition()) {
      allParticlesInPosition = false;
      break;
    }
  }
  
  // 如果所有粒子都已经形成整个人脸轮廓，则让粒子四散到屏幕之外
  if (allParticlesInPosition) {
    for (int i = 0; i < numParticles; i++) {
      particles[i].scatter();
    }
  }
  
/*  if (frameCount < 500) { // 保存前 500 帧
    saveFrame("output-####.png"); // 以帧数为文件名保存 PNG 图片文件
    frameCount++;
    if (frameCount == 500) {
      exit(); // 保存完 500 帧后退出程序
    }
  }
  */
}

class Particle {
  PVector position;
  PVector velocity;
  PVector target;
  
  boolean inPosition = false;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    target = new PVector(x, y);
    gravity = 0; // 取消重力
  }

  void update() {
 // 获取当前位置的像素值
  int pixelValue = referenceImage.get(int(position.x), int(position.y));

  // 将像素值转换为灰度值
  float grayValue = red(pixelValue) * 0.299 + green(pixelValue) * 0.587 + blue(pixelValue) * 0.114;

  // 判断灰度值是否足够接近白色
  float threshold = 200; // 设置判断阈值，可根据需要调整
  float whiteThreshold = 100; // 设置白色判断阈值，可根据需要调整
  if (grayValue > threshold || grayValue > whiteThreshold) {
    target.set(position);
  }

  // 计算粒子的加速度
  PVector acceleration = PVector.sub(target, position);
  acceleration.normalize();
  acceleration.mult(particleSpeed);

  // 更新速度和位置
  velocity.add(acceleration);
  velocity.mult(0.95); // 减少速度，模拟粒子的阻尼效果
  position.add(velocity);

  // 应用重力
  velocity.y += gravity;

  // 如果粒子接近目标位置，则将其设置为静止状态
  float distance = PVector.dist(position, target);
  if (distance < 1) {
    inPosition = true;
  }
}

  void display() {
    // 绘制粒子
    stroke(255);
    strokeWeight(particleSize);
    point(position.x, position.y);
  }

  boolean inPosition() {
    return inPosition;
  }

  void scatter() {
    // 将粒子四散到屏幕之外
    target.x = random(-particleSize, width + particleSize);
    target.y = random(-particleSize, -particleSize * 10);
    inPosition = false;
  }
}

void mousePressed() {
  exit(); // 退出程序
}
