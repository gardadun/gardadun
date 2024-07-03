int diameter = 300;
PVector center;


void setup()
{
  size(800, 800);
  center = new PVector(height/2, width/2);
  noFill();
  background(0);
  stroke(255);
  
  circle(center.x, center.y, diameter);
  
  
  stroke(255, 0, 0);
  for(int i = 0; i < 360; i++)
  {
    line(center.x + diameter / 2 * cos(i), center.y + diameter / 2 * sin(i), center.x + diameter * cos(i), center.y + diameter * sin(i));
  }
  
  //Kind of an eclipse
//   for(int i = 0; i < 360; i++)
//  {
//    line(center.x + diameter / 2 * cos(i), center.y + diameter / 2 * sin(i), center.x + diameter * cos(i), center.y + diameter / 2 * sin(i));
//  }

  for(int i = 0; i < 360; i++)
  {
    line(center.x + diameter / 2 * cos(i), center.y + diameter / 2 * sin(i), center.x + diameter / 2 * cos(i), center.y + diameter * sin(i));
  }
  
  //line(center.x + diameter/2, center.y, center.x + diameter, center.y);
  //line(center.x + diameter/2, center.y, center.x + diameter, center.y);
  
}

  
