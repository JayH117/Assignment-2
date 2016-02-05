// The class name starts with uppercase
class Ball extends GameObject
{
  char move;
  float theta;
  
  int lives;
  int ammo;
  
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

  int elapsed = 12;
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    pos.add(forward);
    
    elapsed ++;
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    stroke(c);
    fill(c);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    ellipse(0, 0, halfW,halfW);
    popMatrix();
  }   
}