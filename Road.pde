class Road{
  
  int roadWidth;
  int paintStep = 15, paintGap = 10;
  
  Car [][] cars;
  
  Road(){
        
    roadWidth = laneNum * laneWidth;
    
    cars = new Car[laneNum][maxCarsInLane];
  }
  
  
  
  void show(){

    fill(0);
    noStroke();
    rect(0, 0, roadWidth, height);
    
    stroke(255);
    for(int i = 1; i < laneNum; i++)
      for(int j = 0; j < height; j+= paintStep + paintGap)
        line(i * laneWidth, j, i * laneWidth, j + paintStep);
        
    
    fill(255);
    for(int i = 0; i < laneNum; i++)
      for(int j = 0; j < maxCarsInLane; j++)
        if(cars[i][j] != null){
          
          float carX = (i * laneWidth) + (laneWidth / (float) 2);
          float carY = (height * 10 - cars[i][j].curP) / 10;
          
          noStroke();
          fill(cars[i][j].getColor());
          ellipse(carX, carY, 5, 5);
          
          if(printCarInfo){
            
            textSize(12);
            fill(90);
            stroke(cars[i][j].getColor());
            
            if(cars[i][j].curV < 27.77)
              rect(carX + 10, carY - 20, 63, 22);
            else
              rect(carX + 10, carY - 20, 70, 22);
              
            fill(255);
            text(nf(cars[i][j].curV * 3.6, 1, 1) + " km/h", carX + 10, carY);
            text(nf(cars[i][j].curP, 1, 1) + " m", carX + 10, carY - 10);
          }
        }
  }
  
  
  void addCar(DriverType dt, int lane, float pos){
    
    int ind = 0;
    
    for(; cars[lane][ind] != null; ind++);
    
    cars[lane][ind] = new Car(dt, lane, pos);
  }
  
  void deleteCar(int lane, float pos){
    
    for(int i = 0; i < maxCarsInLane; i++)
      if(cars[lane][i] != null)
        if(pos < cars[lane][i].curP  + 50 && pos > cars[lane][i].curP - 50)
          cars[lane][i] = null;
    
  }
  
  void randomCars(int num){
    
    for(int i = 0; i < num; i++){
      
      int lane = int(random(0, laneNum));
      int ind = 0;
      
      for(; ind < maxCarsInLane && cars[lane][ind] != null; ind++);
    
      if(ind == maxCarsInLane)
        continue;
      
      
      cars[lane][ind] = new Car(DriverType.values()[int(random(0, 5))], lane, random(0, 7500));
      
    }
    
    
  }
  
  void generateEqual(int num){
    
    for(int i = 0; i < num; i++){
      
      for(int j = 0; j < 5; j++){
        
        int lane = int(random(0, laneNum));
        int ind = 0;
        
        for(; ind < maxCarsInLane && cars[lane][ind] != null; ind++);
      
        if(ind == maxCarsInLane)
          continue;
        
        
        cars[lane][ind] = new Car(DriverType.values()[j], lane, random(0, 7500));
      }
    }
    
    
  }
  
  
  void update(){
    
    float avgVcur = 0;
    carNum = 0;
    
    for(int i = 0; i < laneNum; i++)
      for(int j = 0; j < maxCarsInLane; j++)
        if(cars[i][j] != null){
          

          avgVcur += cars[i][j].curV;
          carNum++;
          
          cars[i][j].update(cars[i]);
          
          if(cars[i][j].lane != i){
            
            Car c = cars[i][j];
            
            int ind = 0;
            for(; ind < maxCarsInLane && cars[c.lane][ind] != null; ind++);
            
            if(ind < maxCarsInLane){
            
              cars[i][j] = null;
              cars[c.lane][ind] = c;
              
              mergeNum++;
              //println("merge " + mergeNum);
            }
          }
          
        }
    
    avgV = avgVcur / carNum * 3.6;
    
    //println("Average speed : " + nf(avgVcur / carNum * 3.6, 3, 1) + "km/h"); 
  }
  
  void clear(){
    
    for(int i = 0; i < laneNum; i++)
      for(int j = 0; j < maxCarsInLane; j++)
        cars[i][j] = null;
    
  }
}
