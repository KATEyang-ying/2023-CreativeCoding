import controlP5.*;
import peasy.*;

ControlP5 slider;
PeasyCam cam;
Button saveButton;

void UI() {
  int sliderWidth = 200;//控制条宽度
  int sliderHeight = 30;//控制条高度

  cam = new PeasyCam(this, 800);

  slider = new ControlP5(this, createFont("微软雅黑", 14));

  slider.addSlider("numRows")
    .setPosition(1580, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 50)
    .setValue(5)
    ;
    
  slider.addSlider("numCols")
    .setPosition(1580, 60)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 50)
    .setValue(5)
    ;
    
  slider.addSlider("gutter")
    .setPosition(1580, 100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 20)
    .setValue(10)
    ;
    
  slider.addSlider("numInnerRectangles")
    .setPosition(1580, 140)
    .setSize(sliderWidth/2, sliderHeight)
    .setRange(0, 4)
    .setValue(2)
    ;  
    
    
  slider.addToggle("innerRec")
    .setPosition(1580,180)
    .setSize(sliderWidth/3, sliderHeight)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
    
  slider.addSlider("numInnerCircles")
    .setPosition(1580, 240)
    .setSize(sliderWidth/2, sliderHeight)
    .setRange(0, 4)
    .setValue(2)
    ;  
    
  slider.addToggle("innercir")
    .setPosition(1580,280)
    .setSize(sliderWidth/3, sliderHeight)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
    
  slider.addSlider("numTriangles")
    .setPosition(1580, 340)
    .setSize(sliderWidth/2, sliderHeight)
    .setRange(0, 4)
    .setValue(2)
    ;  
    
  slider.addToggle("innertri")
    .setPosition(1580,380)
    .setSize(sliderWidth/3, sliderHeight)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
    
  slider.addSlider("numLines")
    .setPosition(1580, 440)
    .setSize(sliderWidth/2, sliderHeight)
    .setRange(0, 10)
    .setValue(2)
    ;  
    
  slider.addSlider("weight")
    .setPosition(1580, 480)
    .setSize(sliderWidth/2, sliderHeight)
    .setRange(1,10)
    .setValue(2)
    ;  
    
  slider.addToggle("innerlin")
    .setPosition(1580,520)
    .setSize(sliderWidth/3, sliderHeight)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
    
  
  saveButton = slider.addButton("save")
    .setPosition(1580,580)
    .setSize(sliderWidth, sliderHeight)
    .setCaptionLabel("Save");
    
  saveButton.addListener(new ControlListener() {
    public void controlEvent(ControlEvent event) {
      if (event.isController() && event.getController() == saveButton) {
        save();
      }
    }
  });




  // 将控制条的文本颜色设置为黑色
  slider.setColorCaptionLabel(color(0));
   
    
}
