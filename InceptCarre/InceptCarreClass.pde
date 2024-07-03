class InceptionCarres
{
  /*
  This class draws an instance of incept carre 
  args : - population : number of carres
         - size       : size of the largest carré
         - rotation   : rotation given of the carres at each step (formula : (step * PI) / rotation)
         - duration   : number of iteration that are going to make the carrés before changing side of rotation
         - color (opt): color of the carre, default : white 
  */
  
  private int population, size, rotation, duration, iter;
  private float ecart, current_rotation;
  private color rects_color = color(255, 100, 100);
  private boolean backward;
  
  InceptionCarres(int population, int size, int rotation, int duration)
  {
    this.population = population;
    this.size = size;
    this.rotation = rotation;
    this.duration = duration;
    
    this.ecart = size/population;
    this.iter = 0;
    this.current_rotation = (this.iter * PI) / this.rotation;
    this.backward = false;
  }
  
  /*
  This function update variables that changes between each loop of drawing
    - increment iteration
    - calculation new rotation
    @todo : change rotation update if we went past the duration
  */
  void step()
  {
    if(!this.backward)
    {
      this.iter++;
      if(this.duration == this.iter || 0 == this.iter)
      {
        this.backward = true;
      }
    }
    else
    {
      this.iter--;
      if(0 == this.iter || this.duration == this.iter)
      {
        this.backward = false;
      }
    }
    this.current_rotation = (this.iter * PI) / this.rotation;
  }
  
  /*
  This function draws the inceptCarre according to current iteration and rotation 
  */
  void display()
  {
    // Draw first carre
    rectMode(CORNERS);
    stroke(rects_color);
    rect(-size, -size, size, size);
    
    // Draw  carres that haven't stopped rotating yet
    pushMatrix();
    for( int i = 1; i < this.iter; i++)
    {
      rectMode(CORNERS);
      rotate(PI/rotation);
      stroke(rects_color);
      rect(-size + (ecart * i), -size + (ecart * i), size - (ecart * i), size - (ecart * i));
    }
    popMatrix();
    
    // Draw carres that have rotate enough
    rotate(this.current_rotation);
    for(int i = this.iter; i < this.population; i++)
    {
      rectMode(CORNERS);
      stroke(rects_color);
      rect(-size + (ecart * i), -size + (ecart * i), size - (ecart * i), size - (ecart * i));
    }
  }
}
