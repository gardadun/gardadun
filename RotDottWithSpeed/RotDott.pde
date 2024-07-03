

int ray = 200;
float speed = 0.1;
int i = 0;
float x,y;
int stop = 100;
Dott[] dottArray = new Dott[5];

void setup()
{
    size(800, 800);
    for(int j = 0; j < dottArray.length; j++)
    {
        dottArray[j] = new Dott(int(random(400)), random(0.5));
    }
    
    background(0);
    stroke(255);
}

void draw()
{
    if( i < stop )
    {
        background(0);  
        translate(width/2, height/2);
        for(int j = 0; j < dottArray.length; j++)
        {
            dottArray[j].step();
            dottArray[j].display();
        }
        i++;
        //saveFrame("Images/" + dottArray.length + "Dots/RotDot_###.tiff");
    }
    else
    {
        noLoop();
    }
    delay(50);
}
