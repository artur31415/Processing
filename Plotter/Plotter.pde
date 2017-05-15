float DataY[] = {0.07, 0.1, 0.15, 0.19, 0.23, 0.23, 0.26, 0.27, 0.31, 0.37, 0.35, 0.4, 0.45};
float DataX[] = {15  , 25 , 40  , 55  , 65  , 70  , 80  , 95  , 100 , 115 , 120 , 125, 140 };

void setup () 
{
  size(1020, 700);  
  background(0);  
  println(height);
  float LastValueX = 50, LastValueY = height - 50;
  
  float SumOfMulti = 0, SumX = 0, SumY = 0, SumOfXPower = 0, MeanX = 0, MeanY = 0;
  
  for(int i = 0; i < DataX.length; ++i)
  {
    SumOfMulti += DataX[i] * DataY[i];
    SumX += DataX[i];
    SumY += DataY[i];
    SumOfXPower += DataX[i] * DataX[i];
    
    MeanX += DataX[i] / DataX.length;
    MeanY += DataY[i] / DataX.length;
  }
  
  float beta = (SumOfMulti - (1 / DataX.length) * (SumX * SumY)) / (SumOfXPower - (1 / DataX.length) * (SumX * SumX));
  float alpha = MeanY - beta * MeanX;
  
  println("For " + DataX.length + " samples, we got:\n");
  println("beta = " + beta + "; alpha = " + alpha);
  
  for(int i = 0; i < DataX.length; ++i)
  {
    float res = alpha + beta * DataX[i];
    println("alpha + beta * " + DataX[i] + " = " + res);
  }
  
  
  /////////////////////////////////////
  for(int i = 0; i < DataX.length; ++i)
  {
    float valueX = map(DataX[i], 0, DataX[DataX.length - 1], 50, width - 50);
    float valueY = map(DataY[i], 0, DataY[DataY.length - 1], 50, height - 50);
    
    stroke(5, 10, 255);     //stroke color
    strokeWeight(3);        //stroke wider
    line(LastValueX, LastValueY, valueX, height - valueY);
    
    LastValueX = valueX;
    LastValueY = height - valueY;
    
    stroke(255, 255, 255, 20);
    strokeWeight(3);
    line(valueX, height - valueY, valueX, height - 50);
    line(valueX, height - valueY, 50, height - valueY);
    
    textSize(10);
    fill(255, 255, 255);
    text(int(DataX[i]), valueX - 5, height - 50 + 20);
    
    text(DataY[i], 10, height - valueY + 2);
  }
  
  stroke(100, 255, 100, 255);     //stroke color
  strokeWeight(3);        //stroke wider
  line(50, 50, width - 50, 50);
  line(50,  height - 50, width - 50,  height - 50);
  line(width - 50, 50, width - 50, height - 50);
  line(50, 50, 50, height - 50);
  
  textSize(10);
  fill(255, 255, 255);
  text("Watts", 50 - 5, height - 50 + 20);
  
  text("Volts", 10, height - 50 + 2);
}