
int size = 1000;

float[] origin = {size/2,size/2};

int n = 50;
int pas = 10;
void setup()
{
  size(1000,1000);
  background(255);
  stroke(0);
  drawAxes(n, pas);
  drawBotLeft(n, pas);
  drawTopLeft(n, pas);
  drawTopRight(n, pas);
  drawBotRight(n, pas);
}

void draw()
{

}


void drawAxes(int dimension, int pas)
{
  line(origin[0] - ((dimension - 1)* pas), origin[1], origin[0] + ((dimension - 1) * pas), origin[1]);
  line(origin[0], origin[1] - ((dimension - 2) * pas), origin[0], origin[1] + ((dimension - 2) * pas));
}


void drawBotLeft(int dimension, int pas)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0; i < dimension; i++)
  {
    xPoints[i] = origin[0] - (i * pas);
    yPoints[i] = origin[1] + ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    stroke(255 - 5 * u, 255 - 5 * u, 255 - 5 * u); 
    line(xPoints[u], origin[1], origin[0], yPoints[u]);
  }
}


void drawTopLeft(int dimension, int pas)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0; i < dimension; i++)
  {
    xPoints[i] = origin[0] - (i * pas);
    yPoints[i] = origin[1] - ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    stroke(255 - 5 * u, 255 - 5 * u, 255 - 5 * u);
    line(xPoints[u], origin[1], origin[0], yPoints[u]);
  }
}


void drawBotRight(int dimension, int pas)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0 ; i < dimension; i++)
  {
    xPoints[i] = origin[0] + (i * pas);
    yPoints[i] = origin[1] + ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    stroke(255 - 5 * u, 255 - 5 * u, 255 - 5 * u);
    line(xPoints[u], origin[1], origin[0], yPoints[u]);
  }
}


void drawTopRight(int dimension, int pas)
{
  float[] xPoints = new float[dimension];
  float[] yPoints = new float[dimension];
  
  
  for(int i = 0 ; i < dimension; i++)
  {
    xPoints[i] = origin[0] + (i * pas);
    yPoints[i] = origin[1] - ((dimension - i) * pas);
  }
  
  for(int u = 0; u < dimension; u++)
  {
    stroke(255 - 5 * u, 255 - 5 * u, 255 - 5 * u);
    line(xPoints[u], origin[1], origin[0], yPoints[u]);
  }
}
