class Dott
{
   private int ray,iter;
   private float speed;
   
   Dott(int ray, float speed)
   {
    this.ray = ray;
    this.speed = speed; 
    this.iter = 0;
   }

   void display()
   {
      line(0, 0, this.ray * cos(this.iter * this.speed), this.ray * sin( this.iter * this.speed));
      circle(this.ray * cos(this.iter * this.speed), this.ray * sin( this.iter * this.speed), 10);
   }

   void step()
   {
      this.iter++;
   }

}
