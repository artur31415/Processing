import peasy.*;

PeasyCam cam;

PImage img;

float MaxZ = 4000;

PVector[][] cloudPoints;


int count = 0;
int imageIndex = 0;
int maxImageIndex = 4;

void loadKinectImage()
{
  img = loadImage("D:/Kinect4_" + imageIndex + ".jpg");
}

void computeCloudPoints()
{
  
  img.loadPixels();
  for(int i = 0; i < img.width; ++i)
  {
    for(int j = 0; j < img.height; ++j)
    {
      float b = brightness(img.pixels[i + j * img.width]);
      float z = map(b, 0, 255, 0, MaxZ);
        
      PVector v = new PVector(i, j, z);
      cloudPoints[i][j] = v;
    }
  }
}

void setup()
{
  size(640, 480, P3D);
  cam = new PeasyCam(this, MaxZ);
  
  loadKinectImage();
  
  cloudPoints = new PVector[img.width][img.height];
  
  
  computeCloudPoints();
  
  println(img.width * img.height);
}

void draw()
{
  background(0);
  //noStroke();
  lights();
  //translate(width / 2, height / 2);
  //sphere(200);
  
  
  for(int i = 0; i < img.width; i += 4)
  {
    for(int j = 0; j < img.height; j += 4)
    {
      PVector v = cloudPoints[i][j];
      if(v.z > 0)
      {
        stroke(map(v.z, 0, MaxZ, 0, 255), 255 - map(v.z, 0, MaxZ, 0, 255), 0);
        strokeWeight(4);
        point(v.x, v.y, v.z);
      }
    }
  }
  
  ++count;
  if(count > 30)
  {
    count = 0;
    ++imageIndex;
    if(imageIndex > maxImageIndex)
    {
      imageIndex = 0;
    }
    loadKinectImage();
    computeCloudPoints();
  }
}