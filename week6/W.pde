float[][] current;
float[][] previous;
float dampening = 0.99;
color a,b;
boolean isSliderClicked = true;
int delaytime=0;
float size=500;


void setup() {
  size(800, 600);
  current = new float[width][height];
  previous = new float[width][height];
  setcolor();
  UI();
}

void draw() {
  loadPixels();

  // 更新水波状态
  for (int i = 1; i < width - 1; i++) {
    for (int j = 1; j < height - 1; j++) {
      current[i][j] = (previous[i - 1][j] + previous[i + 1][j] + previous[i][j - 1] + previous[i][j + 1]) / 2 - current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i + j * width;

      // 计算波纹强度的范围
      float minIntensity = -1.0;
      float maxIntensity = 1.0;
      float intensity = map(current[i][j], minIntensity, maxIntensity, 0, 1);

      // 根据波纹强度插值生成彩色
      color waveColor = lerpColor(a, b, intensity);

      // 将波纹的颜色设置为插值后的值
      pixels[index] = waveColor;
    }
  }

  updatePixels();

  // 更新水波的前一帧状态
  float[][] temp = previous;
  previous = current;
  current = temp;
  
  // 延时
  delay(delaytime);
  

  // 添加波源（通过鼠标位置）
  if (isSliderClicked){
  if (mousePressed && mouseX > 0 && mouseX < width - 1 && mouseY > 0 && mouseY < height - 1) {
    current[mouseX][mouseY] = size;
  }
  }
  
}

//重新随机生成背景色
void setcolor(){
  a=color(random(255), random(255), random(255));
  b=color(random(255), random(255), random(255));
}

//防止滑块区域可以生成水波纹
void mousePressed() {
  if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 210) {
    // 点击了滑块区域内
    isSliderClicked = false;
   
  } else {
    // 点击了滑块区域外
    isSliderClicked = true;
  }
}

//清除水波效果
void clean() {
  loadPixels();

  for (int i = 1; i < width - 1; i++) {
    for (int j = 1; j < height - 1; j++) {
      current[i][j] = 0; // 将 current 数组中的值重置为0
      previous[i][j] = 0; // 将 previous 数组中的值重置为0

      int index = i + j * width;
      pixels[index] = color(a, b, 0); // 将像素值设置为当前颜色
    }
  }

  updatePixels();
}
