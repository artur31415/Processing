import processing.serial.*;

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph 

//Variables to draw a continuous line.
int lastxPos=1;

int lastheight0 = 0;
int lastheight1 = 0;
int lastheight2 = 0;
int lastheight3 = 0;

boolean isToDraw = false;

float data0 = 0;
float data1 = 0;
float data2 = 0;



void setup () 
{
  // set the window size:
  size(1020, 700);        

  // List all the available serial ports
  println(Serial.list());
  // Check the listed serial ports in your machine
  // and use the correct index number in Serial.list()[].

  myPort = new Serial(this, Serial.list()[0], 9600);  //

  // A serialEvent() is generated when a newline character is received :
  myPort.bufferUntil('\n');
  background(0);      // set inital background:
  println(height);
}

void draw () 
{
  float T = height - 280;
  if(isToDraw == true)
  {
    if(data2 > T)
    {
      background(255, 0, 0);
    }
    else
    {
      background(0);
    }
    
    
    stroke(150, 55, 100, 255);     //stroke color
    strokeWeight(3);        //stroke wider
    line(lastxPos, lastheight0, xPos, height - data0);
    
    stroke(150, 155, 255, 50);     //stroke color
    strokeWeight(3);        //stroke wider
    line(lastxPos, lastheight1, xPos, height - data1);
    
    stroke(250, 255, 255, 255);     //stroke color
    strokeWeight(3);        //stroke wider
    line(lastxPos, lastheight2, xPos, height - data2);
    
    stroke(150, 180, 180, 255);     //stroke color
    strokeWeight(3);        //stroke wider
    line(lastxPos, lastheight3, xPos, height - T);
    
    
    lastxPos = xPos;
    lastheight0 = int(height - data0);
    lastheight1 = int(height - data1);
    lastheight2 = int(height - data2);
    lastheight3 = int(height - T);

    // at the edge of the window, go back to the beginning:
    if (xPos >= width) 
    {
      xPos = 0;
      lastxPos= 0;
      background(0);  //Clear the screen.
    } 
    else 
    {
      // increment the horizontal position:
      xPos += 5;
    }
    isToDraw = false;
  }
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);                // trim off whitespaces.
    String[] data = split(inString, ',');
    data0 = float(data[0]);           // convert to a number.
    data1 = float(data[1]);
    data2 = float(data[2]);
    
    int min = 0, max = 580;
    
    println("data0 = " + data0 + "; data1 = " + data1 + "; data2 = " + data2);
    
    data0 = map(data0, min, max, 0, height);
    data1 = map(data1, min, max, 0, height);
    data2 = height -  map(data2, min, max, 0, height);

    //Drawing a line from Last inByte to the new one.
    isToDraw = true;
  }
}