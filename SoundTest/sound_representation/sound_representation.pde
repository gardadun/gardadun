import processing.sound.*;

Amplitude amp;
SoundFile sample;
Waveform waveform;
FFT fft;

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
  
  
}

public void draw()
{
  background(0);
  strokeWeight(2);
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
  stroke(hue, 100, 100);
  
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
  circle(width / 2, height * 3 / 8, vol * 500);
  
  
  
  //Save Frame
  if(sample.isPlaying())
  {
  //  saveFrame("output/" + soundName + "/Img/out_###.tif");
  }  
  
}
