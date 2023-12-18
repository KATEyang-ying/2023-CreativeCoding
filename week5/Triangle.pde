class Triangle {
  PVector[] triVertex;//三角形三个点向量
  PVector[] contourVertex;//三角形三个内轮廓向量
  float contourRatio = 0.25;//内轮廓宽度比例：值越小内轮廓宽度越大，中间孔洞越小
  PVector center;//三角形中心点向量
  PVector normal;//三角形法线向量
  boolean drawShape;//是否绘制三角形
  boolean drawContour;//是否绘制三角形内轮廓
  color c;//颜色

  //构造函数
  Triangle(PVector p1, PVector p2, PVector p3) {//传递三角形的三个向量数据
    triVertex = new PVector[3];
    contourVertex = new PVector[triVertex.length];
    triVertex[0] = p1;
    triVertex[1] = p2;
    triVertex[2] = p3;
    center = ct();//获得三角形中心点向量值
    normal = calcuNormal();//获得三角形法线向量值
    c = color(random(255), random(255), random(255));
  }
  
  

  void run() {
  
     drawTriangle();//绘制三角形
      
      if (showNormalLine) {
        displayNormal();//绘制法线
      }
    }

//[计算三角形法线向量] 
  PVector calcuNormal() {
    PVector p1p2 = PVector.sub(triVertex[1], triVertex[0]);
    PVector p1p3 = PVector.sub(triVertex[2], triVertex[0]);
    PVector norm = p1p2.cross(p1p3);
    return norm;
  }

//[绘制三角形]
  void drawTriangle() {
    beginShape(TRIANGLE);
    stroke(0);
    strokeWeight(1);
    fill(255);
    for (int i = 0; i < triVertex.length; i ++) {
      vertex(triVertex[i].x, triVertex[i].y, triVertex[i].z);
    }
    endShape();
  }

//[计算三角形中心点向量]
  PVector ct() {
    float cx = 0;
    float cy = 0;
    float cz = 0;

    for (int i = 0; i < triVertex.length; i ++) {
      cx += triVertex[i].x;
      cy += triVertex[i].y;
      cz += triVertex[i].z;
    }

    cx /= 3.0;
    cy /= 3.0;
    cz /= 3.0;
    PVector cv = new PVector(cx, cy, cz);

    return cv;
  }

  
//[绘制三角形法线]
  void displayNormal() {
    PVector nm = new PVector(normal.x, normal.y, normal.z);
    nm.normalize();//法线向量归一化
    nm.setMag(10);//设置法线长度为10
    nm.add(center);
    stroke(0);
    strokeWeight(3);
    point(center.x, center.y, center.z);//三角形中心点
    stroke(200, 0, 200);
    strokeWeight(1);
    line(center.x, center.y, center.z, nm.x, nm.y, nm.z);//从三角形中心点向发现顶点绘制一条直线
  }
}
