import peasy.*;

float x = 0.1;
float y = 0;
float z = 0;

float dt = 0.01;
float dx;
float dy;
float dz;

float sigma = 10;
float rho = 28;
float beta = 8.0/3;

ArrayList<PVector> points = new ArrayList<PVector>();

PVector offset;

float currentHue;

PeasyCam cam;

void setup(){
  size(800, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500); 
}

void draw(){
  background(0);
  dx = sigma*(y - x) * dt;
  dy = (x*(rho - z) - y) * dt;
  dz = (x * y - beta * z) * dt;
  
  x += dx;
  y += dy;
  z += dz;
  
  points.add(new PVector(x, y, z));
  
  
  stroke(0, 255, 255);

  translate(0, 0, -80);
  //translate(width/2, height/2);
  scale(5);
  noFill();
  
  currentHue = 0;
  
  beginShape();
  for (PVector v : points){
    stroke(currentHue, 255, 255);
    vertex(v.x, v.y, v.z);
    
    currentHue += 255.0 / points.size();
    
    if(currentHue > 255){
      currentHue = 0;
    }
  }
  endShape();
}
