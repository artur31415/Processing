
int R1 = 400;
int R2 = R1 / 3;
int R3 = R2 / 3;
int R4 = R3 / 3;
int R5 = R4 / 3;
int R6 = R5 / 3;
int R7 = R5 / 3;

int numOfCircles = 10;

int BigR = 300;

int[] R;
float[] A;
float[] IncA;

long lastMillis = 0;

ArrayList<PVector> EndPoints = new ArrayList<PVector>();


float A1 = 0, A2 = 0, A3 = 0, A4 = 0, A5 = 0, A6 = 0;

float k = 10;
float IncA1 = pow(k, 0), IncA2 = -pow(k, 1), IncA3 = pow(k, 2), IncA4 = - pow(k, 3), IncA5 = pow(k, 4), IncA6 = - pow(k, 5);
int C = 0;


int divFactor = 100;



void setup()
{
  IncA1 /= divFactor;
  IncA2 /= divFactor;
  IncA3 /= divFactor;
  IncA4 /= divFactor;
  IncA5 /= divFactor;
  IncA6 /= divFactor;
  
  R = new int[numOfCircles];
  A = new float[numOfCircles];
  IncA = new float[numOfCircles];
  
  for(int i = 0; i < numOfCircles; ++i)
  {
    if(i == 0)
    {
      R[i] = BigR;
    }
    else
    {
      R[i] = R[i - 1] / 3;
    }
    
    A[i] = 0;
    if(i % 2 == 0)
      IncA[i] = pow(k, i - 1);
    else
      IncA[i] = - pow(k, i - 1);
      
    IncA[i] /= divFactor;
  }
  
  
  size(1020, 700);  
  background(0);  
  
  
  //stroke(200, 200, 0);     //stroke color
  //strokeWeight(3);        //stroke wider
  //noFill();
  //ellipse(width / 2, height / 2, R1, R1);
  
  //println(cos(3.1415926));
  
  //for(int a = 0; a < 360; ++a)
  //{
  //  float _x = (R1 + R2) / 2 * cos(a * PI / 180.0);
  //  float _y = (R1 + R2) / 2 * sin(a * PI / 180.0);
  //  ellipse(width / 2 + _x, height / 2 + _y, R2, R2);
  //  //delay(100);
  //}
  //println("Done");
  
  ////ellipse(width / 2, height / 2 - (R1 + R2) / 2, R2, R2);
  //ellipse(width / 2, height / 2 - (R2 + (R1 + R3) / 2), R3, R3);
  //ellipse(width / 2, height / 2 - (R2 + R3 + (R1 + R4) / 2), R4, R4);//R_2_ + ... + R_N-1_ + (R_1_ + R_N_) / 2
  
  //stroke(200, 0, 0);     //stroke color
  //strokeWeight(3);        //stroke wider
  //point(width / 2, height / 2 - (R2 + R3 + R4 + (R1) / 2));
}

void draw()
{
  for(int k = 0; k < divFactor; ++k)
  {
    //background(0);  
    
    //stroke(200, 200, 0);     //stroke color
    //strokeWeight(1);        //stroke wider
    //noFill();
    //ellipse(width / 2, height / 2, R[0], R[0]);
    
    for(int i = 0; i < numOfCircles; ++i)
    {
      A[i] += IncA[i];
      print(A[i]);
      print(";\t");
    }
    println("");
    
    float sumOfX = 0;
    float sumOfY = 0;
    
    for(int i = 0; i < numOfCircles - 1; ++i)
    {
      sumOfX += ((R[i] + R[i + 1]) / 2) * cos(A[i] * PI / 180.0);
      sumOfY += ((R[i] + R[i + 1]) / 2) * sin(A[i] * PI / 180.0);
      //ellipse(width / 2 + sumOfX, height / 2 + sumOfY, R[i + 1], R[i + 1]);
    }
    
    
    //A6 += IncA5;
    
    //A5 += IncA5;
    
    //A4 += IncA4;
    ////if(A4 >= 359 || A4 < -359)
    ////{
    ////  A4 = 0;
    ////}
    //A3 += IncA3;
    
    ////if(A4 % 2 == 0)
    ////{
    ////  A3 += IncA3;
    ////  if(A3 >= 359 || A3 < -359)
    ////  {
    ////    A3 = 0;
    ////  }
    ////}
    
    //A2 += IncA2;
    ////if(A3 % 2 == 0)
    ////{
    ////  A2 += IncA2;
    ////  if(A2 >= 359 || A2 < -359)
    ////  {
    ////    A2 = 0;
    ////  }
    ////}
    
    //A1 += IncA1;
    
    //if(A1 >= 359  || A1 < -359)
    //  {
    //    A1 = 0;
    //    ++C;
        
        
    //    if(C > 3)
    //    {
    //      C = 0;
    //      EndPoints.clear();
    //    }
        
    //  }
    
    //if(A2 % 2 == 0)
    //{
    //  A1 += IncA1;
    //  if(A1 >= 359  || A1 < -359)
    //  {
    //    A1 = 0;
    //    ++C;
        
        
    //    if(C > 3)
    //    {
    //      C = 0;
    //      EndPoints.clear();
    //    }
        
    //  }
    //}
    
    //float _x1 = (R1 + R2) / 2 * cos(A1 * PI / 180.0);
    //float _y1 = (R1 + R2) / 2 * sin(A1 * PI / 180.0);
    //ellipse(width / 2 + _x1, height / 2 + _y1, R2, R2);
    
    //float _x2 = ((R2 + R3) / 2) * cos(A2 * PI / 180.0);
    //float _y2 = ((R2 + R3) / 2) * sin(A2 * PI / 180.0);
    //ellipse(width / 2 + _x1 + _x2, height / 2 + _y1 + _y2, R3, R3);//(R2 + (R1 + R3) / 2)
    
    //float _x3 = ((R3 + R4) / 2) * cos(A3 * PI / 180.0);
    //float _y3 = ((R3 + R4) / 2) * sin(A3 * PI / 180.0);
    //ellipse(width / 2 + _x1 + _x2 + _x3, height / 2 + _y1 + _y2 + _y3, R4, R4);//(R2 + (R1 + R3) / 2)
    
    //float _x4 = ((R4 + R5) / 2) * cos(A4 * PI / 180.0);
    //float _y4 = ((R4 + R5) / 2) * sin(A4 * PI / 180.0);
    //ellipse(width / 2 + _x1 + _x2 + _x3 + _x4, height / 2 + _y1 + _y2 + _y3 + _y4, R5, R5);//(R2 + (R1 + R3) / 2)
    
    //float _x5 = ((R5 + R6) / 2) * cos(A5 * PI / 180.0);
    //float _y5 = ((R5 + R6) / 2) * sin(A5 * PI / 180.0);
    //ellipse(width / 2 + _x1 + _x2 + _x3 + _x4 + _x5, height / 2 + _y1 + _y2 + _y3 + _y4 + _y5, R6, R6);
    
    //float _x6 = ((R6 + R7) / 2) * cos(A6 * PI / 180.0);
    //float _y6 = ((R6 + R7) / 2) * sin(A6 * PI / 180.0);
    //ellipse(width / 2 + _x1 + _x2 + _x3 + _x4 + _x5 + _x6, height / 2 + _y1 + _y2 + _y3 + _y4 + _y5 + _y6, R7, R7);
    
    
    stroke(200, 0, 0);     //stroke color
    strokeWeight(0.5);        //stroke wider
    
    float X = ((R7) / 2) * cos(A6 * PI / 180.0) + sumOfX;
    float Y = ((R7) / 2) * sin(A6 * PI / 180.0) + sumOfY;
    point(width / 2 + X, height / 2 + Y);
    
    //EndPoints.add(new PVector(width / 2 + X, height / 2 + Y));
    
    
    //for (int i = 0; i < EndPoints.size(); i++) 
    //{
    //  stroke(250 - i / 20, i / 10, i / 30);     //stroke color
    //  strokeWeight(1);        //stroke wider
    //  PVector ActualPoint = EndPoints.get(i);
    //  point(ActualPoint.x, ActualPoint.y);
    //}
    //println(EndPoints.size());
  }
}