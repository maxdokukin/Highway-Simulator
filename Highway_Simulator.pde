
int maxCarsInLane = 300;
int laneNum = 5, laneWidth = 30;
boolean printCarInfo = true;

int carNum = 0, emergStops = 0, mergeNum = 0;
float avgV = 0;



enum  DriverType {GRANDPA, NEWKID, AVERAGE, BMWDRIVER, LARGUSDRIVER};

Road r;
SmartBlockManager sbm;

void setup(){
  
  frameRate(60);
  
  size(300, 750);
  pixelDensity(2);
  
  r = new Road();
  sbm = new SmartBlockManager();

}




void draw(){

  r.update();
  sbm.update();
  
  sbm.show();
  r.show();  
  
}


void keyPressed(){
  
  int lane = constrain(mouseX / (int) 30, 0, laneNum);
  float pos = (height - mouseY) * 10;
    
  if(key == 'g')
    r.addCar(DriverType.GRANDPA, lane, pos);
    
  else if(key == 'n')
    r.addCar(DriverType.NEWKID, lane, pos);
    
  else if(key == 'a')
    r.addCar(DriverType.AVERAGE, lane, pos);
    
  else if(key == 'b')
    r.addCar(DriverType.BMWDRIVER, lane, pos);
    
  else if(key == 'l')
    r.addCar(DriverType.LARGUSDRIVER, lane, pos);
    
  else if(key == 'r')
    r.randomCars(10);
    
  else if(key == 'c'){
    
    r.clear();
    emergStops = 0;
    mergeNum = 0;
  }
    
  else if(key == 'p')
    r.generateEqual(1);
        
  else if(key == 'd')
    r.deleteCar(lane, pos);
    
  else if(key == 'i')
    printCarInfo = !printCarInfo;
}
