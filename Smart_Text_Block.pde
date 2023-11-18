class SmartTextBlock{
  
  int labelTextSize, infoTextSize;
  float x, y, w, h;
  String label;
  float info;
  color backgroundColor, labelColor, infoColor;
  
  
  SmartTextBlock(String label, float x, float y, float w, float h){
    
    this.label = label;
    
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    
  }
  
  
  void update(float d){
    
    info = d;
  }
  
  
  void show(){
    
    //background
    stroke(90);
    fill(backgroundColor);
    rect(x, y, w, h);
    
    //label
    textSize(16);
    stroke(labelColor);
    fill(labelColor);
    text(label, (x + w / 2) - (textWidth(label) / 2), y + 20);
    
    //noFill();
    //stroke(255, 0, 0);
    //rect((x + w / 2) - (textWidth(label) / 2), y + 8, textWidth(label), 12);
    
    
    //info
    
    textSize(40);
    stroke(infoColor);
    fill(infoColor);
    text(nf(info, 1, 1), (x + w / 2) - (textWidth(nf(info, 1, 1)) / 2), y + 100);

  }
  
  
  void setColors(color back, color label, color info){
    
    backgroundColor = back;
    labelColor = label;
    infoColor = info;
  }
  
  
  
}
