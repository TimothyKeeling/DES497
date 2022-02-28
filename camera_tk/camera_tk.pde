import processing.video.*;
float w = 25;
float R = random(255);
float G = random (255);
float B = random (255);


Capture cam;

void setup() 
{
  size(1500, 1000);  
  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() 
{
  fill(0, 10);
  rect(0,0,width,height);
  
  if(cam.available()) 
  {
    cam.read(); 
    cam.loadPixels(); 
  }
  grid(); 
}

void grid()
{
  float mx = float(width)/w;
  float my = float(height)/w;
  float xrat = 640.0 / mx;
  float yrat = 480.0 / my;
  for(float y = 0; y < my; y++)
  {
    for(float x = 0; x < mx; x++)
    {
      int n = round((x*xrat)+((y*yrat)*(mx*xrat)));
      //rectangles(x*w,y*w,cam.pixels[n]);
      circles(x*w,y*w,cam.pixels[n]);  
      //rotation(x*w,y*w,cam.pixels[n]);  
    }   
  }  
}

void rectangles(float cx,float cy, color c)
{
  fill(c);
  noStroke();
  rect(cx,cy,w,w);
}

void circles(float cx,float cy, color c)
{
  fill(color(225, 225, 225));
  noStroke();
  //stroke(random(255));
  //strokeWeight(random(10));
  circle(cx+brightness(c),cy,brightness(c)/4);
  
  
}

void rotation(float cx,float cy, color c)
{
  fill(color(255,255,255,100));
  noStroke();
  pushMatrix();
    translate(cx,cy);
    rotate(radians(brightness(c)));
    translate(0,-5);
    rect(0,0,50,10);
  popMatrix();
}
