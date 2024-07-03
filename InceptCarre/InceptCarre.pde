int n = 0;
int p = 100;
int a = 400;
int b = a/p;
InceptionCarres incept = new InceptionCarres(100, a, 120, 200);
void setup()
{
  size(1400, 1600);
  background(0);
  noFill();
  stroke(255);
   
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  incept.display();
  incept.step();
  delay(50);
//    saveFrame("output/B/Img/out_###.png");

}
