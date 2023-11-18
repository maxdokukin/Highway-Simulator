class Car{
  
  float curP = 0, curV, curA, curPos;
  
  float driveDistance, stopDistance, accel, maxVel, mergeMinGap, mergeMinDist, mergeCd, brakeDist;
  
  long lastUpdateTime = 0, lastTimeMerged = -60000;
  
  boolean breaking = false;
  
  int lane = -1;
  
  DriverType driverType; // {GRANDPA, NEWKID, AVERAGE, BMWDRIVER, LARGUSDRIVER}
  
  
  Car(DriverType dt, int l){
    
    driverType = dt;
    lane = l;
    
    setDriverVars();
  }
  
  Car(DriverType dt, int l, float pos){
    
    driverType = dt;
    lane = l;
    curP = pos;
    
    setDriverVars();
  }
  
  
  
  
  
  void setDriverVars(){
    
    float [] params = DriverParams.getDriverParams(driverType.ordinal());

    driveDistance = params[0];
    stopDistance = params[1];
    accel = params[2];
    maxVel = params[3];
    mergeMinGap = params[4];
    mergeMinDist = params[5];
    mergeCd = params[6];
    brakeDist = params[7];
    
    curV = maxVel * 0.5;
    
  }
  
  //float lastPos = 0;
  
  void update(Car [] lineCars){
    
    //true speed measure
    //if(millis() - lastUpdateTime > 1000){
      
    //  lastUpdateTime = millis();
    //  println(curP - lastPos);
      
    //  lastPos = curP;
    //}
  
    
    

    
    if(curP > height * 10 + 50){
      
      curP = 0;
      curV = maxVel * 0.1;
    }
    
  if(curA == 0 && random(100) > 95) //random breaks and accelerations
      curA += random(-500, 1000) / 600;
      
  if(maxVel - curV >= maxVel * 0.05) //if speed is dropping may spped up
      curA += accel / 60;
      
    
    for(int i = 0; i < maxCarsInLane; i++)
      if(lineCars[i] != null && lineCars[i].curP != curP && lineCars[i].curP - curP > 0){
        
        //if not moving
        if(curV == 0){
          
          //start up

          //if(lineCars[i].curP - curP >=  mergeMinDist)
          //  curA = map(lineCars[i].curP - curP, mergeMinDist, 2 * mergeMinDist, accel / 2, accel);
          curA = 1;
        }
        else{
        
          //break zone
          if(lineCars[i].curP - curP <=  brakeDist){
             
              //println(driverType + " approacing " + lineCars[i].driverType + "  distance " + (lineCars[i].curP - curP) + "m");
  
              curA = (map(lineCars[i].curP - curP, brakeDist, driveDistance, -1, accel * -1) + (curA * 4)) / 5;// * (driveDistance - lineCars[i].curP - curP);
              
              //merge
              if(millis() - lastTimeMerged >= mergeCd && random(10) < 2){
                
                
                
                lastTimeMerged = millis();
                
                if(lane == 0)
                  lane++;
                  
                else if(lane == laneNum - 1)
                  lane--;
                  
                else
                  lane += random(10) < 7 ? -1 : 1;
                  
                
              }
                
  
            }
          
          //close break
          if(lineCars[i].curP - curP <=  driveDistance){
             
              curA = (map(lineCars[i].curP - curP, driveDistance, 3, accel, accel * 4) + (curA * 4)) / -5;// * (driveDistance - lineCars[i].curP - curP);
              //println(driverType + " approacing " + lineCars[i].driverType + "  emergency breaking at " + nf(curA, 2, 1) + "m/s, distance " + nf((lineCars[i].curP - curP), 3, 0) + "m");
            }
            
          //emergency break
          if(curV > 10 && lineCars[i].curP - curP <=  3){
             
              curV = 0;
              curA = 0;
              emergStops++;
              //println(driverType + "  emergency stopped");
            }
          }
        }

   

    if(curV + curA < maxVel && curV + curA > 0)
      curV += curA / 60;
    
    else
      curA = 0;
      
    curP += curV / 60;
  }
  
  
  
  
  
  
  
  color getColor(){
    
    color c = 0;

    switch(driverType){
      
      case GRANDPA:
        c = color(39, 245, 94);
      break;
      
      
      
      case NEWKID: 
        c = color(37, 217, 196);
      break;
  
  
  
      case AVERAGE:
        c = color(56, 42, 209);
      break;
      
      
      
      case BMWDRIVER:
        c = color(222, 219, 49);
      break;
    
    
    
      case LARGUSDRIVER:
        c = color(224, 29, 52);
      break;
    }
    
  
    return c;
  }
}
