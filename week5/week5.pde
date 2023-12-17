/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
 * @Date:   2022-07-29 09:27:56
 * @brief:
 * @Last Modified by:   lymanzhang
 * @Last Modified time: 2022-10-20 21:21:53
 * @E-mail: zhanglliqun@gmail.com
 * @detail:
 */

ArrayList<Triangle> triangles;
//String timestamp;
PVector[][] vp;
boolean record;

int heightSection = 36;//圆柱体高度细分数
int laySection = 72;//圆柱体每层扇面细分数
int layer=15;//定位某一层

int layer2=20;//某一层高度（到z-2的地方）
int layer22=0;//定位某一层高度,滑块可变（到z-2的地方）
float radiu = 200;//圆柱体半径
float radius = 200;//圆柱体半径
float[] layerRadii; // 存储每个层级的半径值的数组
float layerHeight = 20;//每层高度


float rotateRange = PI;//圆柱体轴向扭曲弧度值
boolean showNormalLine;//是否显示法线

float ProbOfShowShape = 0.75;//每个三角形单元的显示概率
float ProbOfShowContourShape = 0.5;//每个三角形单元绘制内轮廓的概率

void setup() {
  size(1200, 1200, P3D);
  surface.setLocation(50, 50);

  
  UI();
  setSystem();
 
}


void setSystem() {
  initiateModelData();//初始化构成圆柱体的空间向量数组
  
  for (int i = 0; i < vp[layer].length; i++) {
    float angSection = TWO_PI / vp[0].length;//每一层圆面切分为扇面后每个扇面的角的值
    float sectionPhaseAngle = rotateRange / vp.length;//圆柱体整体扭曲角分配到每层的相位值
    vp[layer][i].set(radius * cos(angSection * i + sectionPhaseAngle * layer), radius * sin(angSection * i + sectionPhaseAngle * layer), vp[layer][i].z);
  } 
 
  
  buildMesh(vp);//基于空间向量数组创建三角形对象

  for (Triangle t : triangles) {
    if (random(1)<ProbOfShowShape) {//如果该随机值满足该概率条件
      t.drawShape = true;
      if (random(1)<ProbOfShowContourShape){//如果该随机值满足该概率条件
        t.drawContour = true;
      }  
    }
  }
}


void draw() {
 /* if (record) {
   timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
   beginRecord("nervoussystem.obj.OBJExport", "D:/你交课程/大二上/创意编程/作业/week5" + timestamp + ".obj");
  }
  
  if (record) {
    endRecord();
    record = false;
  }
  */
  background(102);

  lights();

  for (Triangle t : triangles) {//遍历所有的三角形
    fill(t.c);
    t.run();
  }
  
  cam.beginHUD();
  slider.draw();
  cam.endHUD();
  
  if ((mouseX<360 && mouseY< 260) || (mouseX<150 && mouseY > height-150)) {//此限定区域为滑块所在位置
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
  
  //定位到某一行，让该行的点被标示出来
  for (int i = 0; i < vp.length; i++) {
  for (int j = 0; j < vp[0].length; j++) {
    if (i == layer) {
      fill(255, 255, 0);
      strokeWeight(20);
      point(vp[i][j].x, vp[i][j].y, vp[i][j].z);
    }
  }
}


  
  
}



void initiateModelData() {
  vp= new PVector[heightSection][laySection];//生成一个heightSection X laySection的网格，并未网格上的每个点（向量）赋值
  for (int i = 0; i < vp.length; i ++) {
    float angSection = TWO_PI / vp[0].length;//每一层圆面切分为扇面后每个扇面的角的值
    float sectionPhaseAngle = rotateRange / vp.length;//圆柱体整体扭曲角分配到每层的相位值
    for (int j = 0; j < vp[0].length; j ++) {
      float xx = radiu * cos(angSection * j + sectionPhaseAngle * i);
      float yy = radiu * sin(angSection * j + sectionPhaseAngle * i);
      float zz = i * layerHeight; 
      vp[i][j] = new PVector(xx, yy, zz);
    }
  }
}


void buildMesh(PVector[][] model) {
  triangles = new ArrayList<Triangle>();

  for (int i = 0; i < model.length-1; i ++) {
    for (int j = 0; j < model[0].length; j ++) {
      PVector p1 = new PVector(model[i][j].x, model[i][j].y, model[i][j].z);
      PVector p2 = new PVector(model[i+1][j].x, model[i+1][j].y, model[i+1][j].z);
      PVector p3 = new PVector(model[i][(j+1)%model[0].length].x, model[i][(j+1)%model[0].length].y, model[i][(j+1)%model[0].length].z);
      PVector p4 = new PVector(model[i+1][(j+1)%model[0].length].x, model[i+1][(j+1)%model[0].length].y, model[i+1][(j+1)%model[0].length].z);
      triangles.add(new Triangle(p1, p3, p2));//右手定则确定三角形三个点的顺序，该顺序影响三角形发现的方向
      triangles.add(new Triangle(p2, p3, p4));//每四个点组成的网格可分为两个共边的三角形
    }
  }
 
}
/*
void keyPressed() {
  print(key);
  if (key == 's') {
    record = true;
  }
  
  */
