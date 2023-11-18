class SmartBlockManager{
  
  int blockNum = 5;
  
  SmartTextBlock [] blocks = new SmartTextBlock[5];


  SmartBlockManager(){
    
    blocks[0] = new SmartTextBlock("Average speed", 150, 0, 150, 150);
    blocks[1] = new SmartTextBlock("Number of cars", 150, 150, 150, 150);
    blocks[2] = new SmartTextBlock("Merges", 150, 300, 150, 150);
    blocks[3] = new SmartTextBlock("Emergency breakings", 150, 450, 150, 150);
    blocks[4] = new SmartTextBlock("Traffic slowence", 150, 600, 150, 150);
    
    blocks[0].setColors(color(121, 180, 183), color(248, 240, 223), color(254, 251, 243));
    blocks[1].setColors(color(121, 180, 183), color(248, 240, 223), color(254, 251, 243));
    blocks[2].setColors(color(121, 180, 183), color(248, 240, 223), color(254, 251, 243));
    blocks[3].setColors(color(121, 180, 183), color(248, 240, 223), color(254, 251, 243));
    blocks[4].setColors(color(121, 180, 183), color(248, 240, 223), color(254, 251, 243));
  }

  void updateBlock(int id, float data){
    
    blocks[id].update(data);
    
  }
  
  void update(){
    
    blocks[0].update(avgV);
    blocks[1].update(carNum);
    blocks[2].update(mergeNum);
    blocks[3].update(emergStops);
    
    
  }
  
  
  
  
  void show(){
    
    for(int i = 0; i < blockNum; i++)
      blocks[i].show();
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}
