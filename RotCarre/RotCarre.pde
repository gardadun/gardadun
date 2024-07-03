int n = 0;
int stop = 0;
void setup()
{
  size(800, 800);
  background(0);
  noFill();
  stroke(255);
  stop = int(random(60));
  print("nb steps = " + stop);
}


void draw()
{  
  if(n < stop)
  {
      
    translate(width/2, height/2);
    for(int i = 0; i< 20; i++)
    {
      rectMode(CORNERS);
      rotate(n * PI / (stop / 2));
      stroke(random(255), random(255), random(255));
      rect(-10 * i, -10 * i, 10 * i, 10 * i);  
    }
  }
  else
  {
    saveFrame("Images/RotCarre"+stop+".png");
    noLoop();
  }
  n++;

}
