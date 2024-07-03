import processing.sound.*;
import controlP5.*;
import ddf.minim.*;

float theta; //Angle at which the fractal tree branches
float hue = 0; //Color of the stroke
Amplitude amp;
AudioIn in;
SoundFile file;

void setup()
{
 size(1500, 1500);
 colorMode(HSB);
 file = new SoundFile(this, "7sur7.mp3");
 amp = new Amplitude(this); // Amplitude object
 //in = new AudioIn(this, 0); //AudioIn object
 //in.start();
 file.play();
 amp.input(file);
}

void draw()
{
 background(0);
 frameRate(30);
 stroke(hue, 255, 255);
 //Picks an angle from 0 to 90 degrees based on the 
 //volume(measured by the root mean square of the amplitude)
 float a = ((amp.analyze()*4000) / (float) width) * 45f;
 theta = radians(a);
 translate(width/2, height);
 line(0, 0, 0, -400);
 translate(0, -400);
 branch(400);

 saveFrame("output/Img/7sur7/out_###.png");
}

//recursive function to draw the tree
void branch(float h) {
  h *= 0.66;
  if (h > 2) {
    //relates the amplitude to color
    hue =amp.analyze()*4000;
    stroke(hue, 255, 255);
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h); 
    translate(0, -h); 
    branch(h);      
    popMatrix();     
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
