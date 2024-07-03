//TROP DUR POUR MOI POUR LE MOMENT

float[] originTriangle = {(1000 / 2 - 1000/3), (1000/2 - 1000/3), (1000/2 + 1000/3)};
float[] origin = {1000/2, 1000/2};

void setup()
{
  size(1000,1000);
}

void draw()
{
  drawFirstTriangle();
  drawTriangleSymetric();
}

void drawFirstTriangle()
{
  line(origin[0], originTriangle[0], originTriangle[2], origin[1]); 
  line(originTriangle[1], origin[1], origin[0], originTriangle[0]);
  line(originTriangle[1], origin[1], originTriangle[2], origin[1]);
}

void drawTriangleSymetric()
{
    line(origin[0], 1.5 * origin[1] + originTriangle[0], originTriangle[2], origin[1]); 
    line(originTriangle[1], origin[1], origin[0], 1.5 * origin[1] + originTriangle[0]);
    line(originTriangle[1], origin[1], originTriangle[2], origin[1]);
}
