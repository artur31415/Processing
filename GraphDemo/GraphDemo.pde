// Pro_Graph2.pde
/*
 Used in the Youtube video "Arduino and Processing ( Graph Example )"
 Based in the Tom Igoe example.
 Mofified by Arduining 17 Mar 2012:
  -A wider line was used. strokeWeight(4);
  -Continuous line instead of vertical lines.
  -Bigger Window size 600x400.
-------------------------------------------------------------------------------
This program takes ASCII-encoded strings
from the serial port at 9600 baud and graphs them. It expects values in the
range 0 to 1023, followed by a newline, or newline and carriage return

Created 20 Apr 2005
Updated 18 Jan 2008
by Tom Igoe
This example code is in the public domain.
*/

import processing.serial.*;

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph 

//Variables to draw a continuous line.
int lastxPos=1;
int lastheight0 = 0;
int lastheight1 = 0;
boolean isToDraw = false;
float heartRate = 0;
float temperature = 0;



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
  if(isToDraw == true)
  {
    stroke(100, 55, 100, 255);     //stroke color
    strokeWeight(3);        //stroke wider
    line(lastxPos, lastheight0, xPos, height - heartRate);
    
    stroke(100, 155, 255, 50);     //stroke color
    strokeWeight(3);        //stroke wider
    line(lastxPos, lastheight1, xPos, height - temperature);
    
    
    lastxPos = xPos;
    lastheight0 = int(height - heartRate);
    lastheight1 = int(height - temperature);

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
      xPos += 10;
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
    heartRate = float(data[0]);           // convert to a number.
    temperature = float(data[1]);
    int max = 1023;
    int min = 700;
    if(heartRate > max)
      heartRate = max;
    println("heartRate = " + heartRate + "Temperature = " + temperature);
    
    heartRate = map(heartRate, min, max, 0, height);
    temperature = map(temperature, 20, 50, 0, height);

    //Drawing a line from Last inByte to the new one.
    isToDraw = true;
  }
}