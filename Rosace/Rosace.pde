PVector center;

void setup()
{
  size(400, 400);
   noFill();
  center = new PVector(width/2, height/2);
  int diameter = 300;
  circle(center.x, center.y, diameter);
 
  /*arc(center.x, center.y, diameter, diameter/3, 0 * PI, (0 * PI) + PI);
  arc(center.x, center.y, diameter, diameter/3, 1 * PI, (1 * PI) + PI);
  
  arc(center.x, center.y, diameter/3, diameter, PI/2, PI/2 + PI);
  arc(center.x, center.y, diameter/3, diameter, 3*PI/2, 3*PI/2 + PI);
  */
  
  //rotate(PI/3);
  //arc(center.x, center.y, diameter,  diameter / 3, 0, PI);
 
  arc(center.x + cos(radians(PI/6)) * diameter / 2, center.y + sin(radians(PI*6)) * diameter / 2, diameter, diameter/3,  PI/6, PI /6 + PI);
  
 print(center.x + cos(radians(PI/6)) * diameter / 2 + "\n");
 print(center.y + sin(radians(PI*6)) * diameter / 2 + "\n");
 // arc(center.x, center.y, diameter, diameter/3, 0 * PI, (0 * PI) + PI);
 // arc(center.x, center.y, diameter, diameter/3, 1 * PI, (1 * PI) + PI);
 
 //drawRosace4(center, 300); //<>//
}

void draw()
{
}

/*
  Args : 
    - center : Pvector, coordinates of the center
    - diameter : int, diameter of the center 
    This number is multiplied by 4 to create the actual arcs of the rosette 
*/
void drawRosace4(PVector center, int diameter)
{
  noFill();
  circle(center.x, center.y, diameter);
  //arc right
  arc(center.x + (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, 0 * PI, (0 * PI) + PI);
  arc(center.x + (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, PI, 2* PI);
  
  //arc left
  arc(center.x - (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, 0, PI);
  arc(center.x - (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, PI, 2* PI);
  
  //arc top
  arc(center.x, center.y + (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, PI/2, PI/2 + PI);
  arc(center.x, center.y + (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, 3*PI/2, 3*PI/2 + PI);
  
  //arc bottom
  arc(center.x, center.y - (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, PI/2, PI/2 + PI);
  arc(center.x, center.y - (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, 3*PI/2, 3*PI/2 + PI);
  
}


/*
  Args : 
    - center : Pvector, coordinates of the center
    - diameter : int, diameter of the center 
    This number is multiplied by 4 to create the actual arcs of the rosette 
*/
void drawRosace8(PVector center, int diameter)
{
  noFill();
  circle(center.x, center.y, diameter);
  //arc right
  arc(center.x + (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, 0 * PI, (0 * PI) + PI);
  arc(center.x + (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, PI, 2* PI);
  
  //arc left
  arc(center.x - (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, 0, PI);
  arc(center.x - (center.x + diameter/2 - center.x) / 2, center.y, diameter/2, diameter/8, PI, 2* PI);
  
  //arc top
  arc(center.x, center.y + (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, PI/2, PI/2 + PI);
  arc(center.x, center.y + (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, 3*PI/2, 3*PI/2 + PI);
  
  //arc bottom
  arc(center.x, center.y - (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, PI/2, PI/2 + PI);
  arc(center.x, center.y - (center.y + diameter/2 - center.y) / 2, diameter/8, diameter/2, 3*PI/2, 3*PI/2 + PI);
  
}
