static class DriverParams{
  
  static float [] allParams;
  
  static void initializeParams(){
    
    allParams = new float[50];
    
      //driveDistance, stopDistance, accel, maxVel, mergeMinGap, mergeMinDist, mergeCd, brakeDistance, ;
    
    allParams[0] = 50;  //driveDistance
      allParams[1] = 10; //stopDistance
      allParams[2] = 3; //accel
      allParams[3] = 16.6667; //maxVel
      allParams[4] = 50; //mergeMinGap
      allParams[5] = 20; //mergeMinDist
      allParams[6] = 60000; //merge cooldown
      allParams[7] = 300;  //brake distance
      allParams[8] = 0; //minStartDistance (distance infront to start)
      allParams[9] = 0;
    allParams[10] = 30;
      allParams[11] = 7;
      allParams[12] = 5;
      allParams[13] = 22.2222;
      allParams[14] = 40;
      allParams[15] = 15;
      allParams[16] = 40000;
      allParams[17] = 250;
      allParams[18] = 0;
      allParams[19] = 0;
    allParams[20] = 20;
      allParams[21] = 3;
      allParams[22] = 9;
      allParams[23] = 27.7778;
      allParams[24] = 25;
      allParams[25] = 10;
      allParams[26] = 25000;
      allParams[27] = 200;
      allParams[28] = 0;
      allParams[29] = 0;
    allParams[30] = 10;
      allParams[31] = 2;
      allParams[32] = 12;
      allParams[33] = 33.3333;
      allParams[34] = 10;
      allParams[35] = 3;
      allParams[36] = 15000;
      allParams[37] = 100;
      allParams[38] = 0;
      allParams[39] = 0;
    allParams[40] = 5;
      allParams[41] = 1;
      allParams[42] = 17;
      allParams[43] = 907.22;//38.8889;
      allParams[44] = 5;
      allParams[45] = 1;
      allParams[46] = 10000;
      allParams[47] = 75;
      allParams[48] = 0;
      allParams[49] = 0;
  }
  
  
  static float[] getDriverParams(int dt){
    
    if(allParams == null)
      initializeParams();
      
      
    float []res = new float[10];
    
    for(int i = 0; i < 10; i++)
      res[i] = allParams[dt * 10 + i];
    
    return res;
  }
  
  
  
  
  
  
  
}
