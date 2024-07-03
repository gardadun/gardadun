import processing.sound.*;

Amplitude amp;
SoundFile sample;
Waveform waveform;
FFT fft;

PVector centerCircle;
PVector centerTopLeft;
PVector centerTopRight;

float vol = 0;
float hue = 0;
int bands = 1024;
int samples = 3000;
float[] spectrum = new float[bands];

String soundName = new String("Halibo");

public void setup()
{
 // frameRate(10);
  size(1200, 1200);
  strokeWeight(1);
  background(255);
  colorMode(HSB);
  sample = new SoundFile(this, "../"+soundName+".mp3");
  sample.play();
  
  fft = new FFT(this, bands);
  fft.input(sample);
  
  waveform = new Waveform(this, samples);
  waveform.input(sample);
  
  amp = new Amplitude(this);
  amp.input(sample);
  
  centerCircle = new PVector(width/2, height * 3 / 8);
  centerTopLeft = new PVector(width - 1100, height / 4);
  centerTopRight = new PVector(1100, height / 4);
}


public void draw()
{
  background(0);
  //strokeWeight(2);
  noFill();
  
  
  
  //Draw waveform in white
  waveform.analyze();
  stroke(0, 0, 200);
  beginShape();
  for(int i = 0; i < samples; i++)
  {
    //hue = (i + random(255)) %255;
    
    vertex(
      map(i, 0, samples, 0, width),
      map(waveform.data[i], -1, 1, height*3/4, height)
    );
  }
  endShape();
  
  //Get sound amplitude
  vol = amp.analyze();
  
  //Get color from sound amplitude
  hue = round(vol * 255);
  stroke(hue, 255, 255);
  
  //Draw FFT baseline
  line(0, height*3/4, width, height*3/4);
  
  
  //Draw FFT
  fft.analyze(spectrum);
  for(int i =0; i< bands; i++)
  {
    //hue = i%255;
    //stroke(hue, 255, 255);
    
    //Create a cuve with the bands
    if(i%2 ==0)
    { 
      line((width - bands)/2 +i, height*3/4, (width - bands)/2 +i, height*3/4 - spectrum[i]*height*3/4);
    }  
    else
    {
      line((width + bands)/2 -i, height*3/4, (width + bands)/2 -i, height*3/4 - spectrum[i]*height*3/4);
    }
  }
  
  //Draw a circle, size in function of amplitude
  circle(width / 2, height * 3 / 8, vol * 800);
  
  //draw star in center of circle
  drawStar(int(vol * 50), 10, centerCircle);

 stroke(180, 255,  255);
 strokeWeight(2);
 
 drawStar(int(vol * 30), 5, centerTopLeft);

 
 drawStar(int(vol * 30), 5, centerTopRight);
  //Save Frame
  if(sample.isPlaying())
  {
  //  saveFrame("output/" + soundName + "/Img/out_###.tif");
  }  
  
}

void drawStar(int dimension, int pas, PVector center)
{
  drawAxes(dimension, pas, center);
  drawBotLeft(dimension, pas, center);
  drawTopLeft(dimension, pas, center);
  drawTopRight(dimension, pas, center);
  drawBotRight(dimension, pas, center);  
}



void drawAxes(int dimension, int pas, PVector center)
{
 line(center.x - ((dimension - 1)* pas), center.y, center.x + ((dimension - 1) * pas), center.y);
 line(center.x, center.y - ((dimension - 2) * pas), center.x, center.y + ((dimension - 2) * pas));
}


void drawBotLeft(int dimension, int pas, PVector center)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0; i < dimension; i++)
  {
    xPoints[i] = center.x - (i * pas);
    yPoints[i] = center.y + ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    line(xPoints[u], center.y, center.x, yPoints[u]);
  }
}


void drawTopLeft(int dimension, int pas, PVector center)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0; i < dimension; i++)
  {
    xPoints[i] = center.x - (i * pas);
    yPoints[i] = center.y - ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    line(xPoints[u], center.y, center.x, yPoints[u]);
  }
}


void drawBotRight(int dimension, int pas, PVector center)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0 ; i < dimension; i++)
  {
    xPoints[i] = center.x + (i * pas);
    yPoints[i] = center.y + ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    line(xPoints[u], center.y, center.x, yPoints[u]);
  }
}


void drawTopRight(int dimension, int pas, PVector center)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0 ; i < dimension; i++)
  {
    xPoints[i] = center.x + (i * pas);
    yPoints[i] = center.y - ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    line(xPoints[u], center.y, center.x, yPoints[u]);
  }
}
