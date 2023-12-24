import controlP5.*;
import peasy.*;

ControlP5 slider;
Button changecolor;
Button clean;

void UI() {
  slider = new ControlP5(this, createFont("微软雅黑", 12));
  
  changecolor = slider.addButton("changecolor")
    .setPosition(20, 20)
    .setSize(100, 40)
    .setValue(0)
    .setCaptionLabel("changecolor"); // 按钮的显示文本
    
   clean = slider.addButton("clean")
    .setPosition(20, 70)
    .setSize(100, 40)
    .setValue(0)
    .setCaptionLabel("clean"); // 按钮的显示文本
    
  slider.addSlider("size")//初始波纹大小
    .setPosition(20, 120)
    .setSize(100, 40)
    .setRange(10, 1000)
    .setValue(500)
    ;
  
  slider.addSlider("delaytime")//波纹扩张速度
    .setPosition(20, 170)
    .setSize(100, 40)
    .setRange(0, 50)
    .setValue(0)
    ;
    
 
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(slider.getController("changecolor")) ){
    setcolor();
  }
    
  if (theEvent.isFrom(slider.getController("clean")) ){
    clean();
  }
  }
