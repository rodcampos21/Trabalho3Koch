int maximo = 4;

void mouseClicked()
{
  if(maximo < 6)
  {
    maximo +=1;
  }
  else 
  {
    maximo=0;
  }
  
}

void setup() 
{
  size(600,600); 
}

void draw()
{
  background(100000);
  beginShape();
  koch(20, 300, 580, 300, 0);  
}
//ax = kochx , ay = kochy , bx = bkochx , by = bkochy, ang =angulo , _px= kochpx , _py = kochpy
float[] roda(float kochx, float kochy, float bkochx, float bkochy, float angulo)
{
  float kochpx = ((bkochx-kochx)*cos(angulo) - (bkochy-kochy)*sin(angulo))+kochx;
  float kochpy = ((bkochx-kochx)*sin(angulo) + (bkochy-kochy)*cos(angulo))+kochy;
  return new float[] { kochpx, kochpy };
}
void koch( float x0, float y0, float xf, float yf, int nivel)
{
  if(nivel == maximo)
  {
    stroke(100);
    line(x0, y0, xf, yf);
  }
  else
  {
    beginShape();
   

     float x1 = (1-(1/3.0))*x0 + (1/3.0)*xf;
     float y1 = (1-(1/3.0))*y0 + (1/3.0)*yf;
     float x3 = (1-(2/3.0))*x0 + (2/3.0)*xf;
     float y3 = (1-(2/3.0))*y0 + (2/3.0)*yf;
    float retorno[]= roda(x1,y1,x3,y3,-PI/3);
            koch(x0,y0,x1,y1,nivel+1);
            koch(x1,y1,retorno[0],retorno[1],nivel+1);
            koch(retorno[0],retorno[1],x3,y3,nivel+1);
            koch(x3,y3,xf,yf,nivel+1);
            
            endShape(CLOSE);
  }
}  
