import processing.sound.*;

SoundFile sample;
FFT fft;

int bands = 512;
float[] spectrum = new float[bands];
PVector center;
int diameter = 300;

void setup() {
  size(600, 600);
  background(255);
  
  
  center = new PVector(width/2, height/2);
  // Create an Input stream which is routed into the Amplitude analyzer
  sample = new SoundFile(this, "../Halibo.mp3");
  sample.play();
  fft = new FFT(this, bands);

  // patch the AudioIn
  fft.input(sample);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);
  
  circle(center.x, center.y, diameter);
  
  for(int i = 0; i < bands; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  line( i, height, i, height - spectrum[i]*height*5 );
  }   

}
