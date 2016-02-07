// The class name starts with uppercase
class Ball extends GameObject
{
  float theta;
  
  Ball()
  {
    super(width * 0.5f, height  * 0.5f, 50);     
  }
  
  Ball(float startX, float startY, color c)
  {
    super(startX, startY, 50);
    this.c = c;
    halfW = w * 0.5f;  
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    pos.add(forward);
  }
  
  void render()
  {
    pushMatrix(); 
    translate(pos.x, pos.y);
    stroke(c);
    fill(c);
    rotate(theta); 
    ellipse(0, 0, halfW,halfW);
    popMatrix();
  }   
}