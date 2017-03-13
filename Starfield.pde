Particle [] normal;
public void setup()
{
  size(500,500);
  normal = new Particle[50];
  
  for(int i = 0; i < normal.length; i++){
  normal[i] = new NormalParticle();
  }
  normal[1] = new OddballParticle();
  normal[2] = new JumboParticle();
}
void draw()
{
  fill(50, 0, 0, 44);
  rect(0, 0, 500, 500);
  for (int i = 0; i < normal.length; i++)
  {
    normal[i].move();
    normal[i].show();
  }
}
class NormalParticle implements Particle
{
  int col;
  double dX, dY, theta, speed, a, b;
  
  NormalParticle()
  {
    dX = 250;
    dY = 250;
    theta = (Math.random()*2*Math.PI);
    speed = (Math.random()*3);
    col = color((int)(Math.random()*230),(int)(Math.random()*100),(int)(Math.random()*90));
  }
  public void move(){
    a = (Math.cos(theta)*speed);
    b = (Math.sin(theta)*speed);
    dX = dX - a;
    dY = dY - b;
   
   if(dX>501 || dY>501){
     dX = 250;
     dY = 250;
   }
   else if (dX<0 || dY<0)
   {
     dX = 250;
     dY = 250;
   }
 }  
  public void show()
  {
  fill(col);
  ellipse((float)dX, (float)dY, 7, 7);
  }  
}   
interface Particle
{  
  public void show();
  public void move();
}
class OddballParticle implements Particle //uses an interface
{
  int col, dx, dy, dz, da, db;
  OddballParticle()
  {
    dx = (int)(Math.random()*499);
    dy = (int)(Math.random()*499);
    col = color((int)(Math.random()*250),(int)(Math.random()*250), (int)(Math.random()*250));
   }
  public void show(){
    noStroke();
    fill(255,111,201);
    rect((float)dx,(float)dy, 50, 50);
   }
  public void move(){
   da=(int)(Math.random()*6)-2;
   db=(int)(Math.random()*4)-2;
   dx= dx+da;
   dy= dy+db;
   
   if(dx>501 || dy>501)
   {
     dx=250;
     dy=250;
  }   
  else if (dx<0 || dy<0)
  {
    dx=250;
    dy=250;
  }
 } 
}
class JumboParticle extends NormalParticle 
{
  public void show()
  {
  fill(250,50,90,50);
  ellipse((float)dX,(float)dY, 75, 75);
}
}
