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

int diameter = 300;

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
  
  //Get sound amplitude
  vol = amp.analyze();
  
  //Get color from sound amplitude
  hue = round(vol * 255);
  stroke(hue, 255, 255);
  
  circle(centerCircle.x, centerCircle.y, diameter);
  
  
  //Draw FFT
  fft.analyze(spectrum);
  
    for(int i = 0; i < 360; i++)
  {
    line(centerCircle.x + diameter / 2 * cos(i), centerCircle.y + diameter / 2 * sin(i), centerCircle.x + (spectrum[i]* 500 +  diameter ) * cos(i), centerCircle.y + diameter / 2 * sin(i));
  }
  //Save Frame
  if(sample.isPlaying())
  {
  //  saveFrame("output/" + soundName + "/Img/out_###.tif");
  }  
  
}
