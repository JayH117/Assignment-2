class Line extends GameObject
{
  char up;
  char down;
  char left;
  char right;
  char side = up;
  int rwidth;
  int rlength;
  
  Line()
  {
    super(width * 0.5f, height  * 0.5f, 50);     
  }
  
  Line(char up, char down, char left, char right, float startX, int rwidth, int rlength, float startY, color c)
  {
    super(startX, startY, 50);
    this.up = up;
    this.left = left;
    this.right = right;
    this.down = down;
    this.side = side;
    this.rwidth = rwidth;
    this.rlength = rlength;
    this.c = c;
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);

    if (keys[left])
    {
      side = left;
    }
    if (keys[right])
    {
      side = right;
    }
    if (keys[up])
    {
      side = up;
    }
    if (keys[down])
    {
      side = down;
    } 
    
    if(side == up)
    {
      pos.x = mouseX-35;
      pos.y = 5;
    }
    if(side == down)
    {
      pos.x = mouseX-35;
      pos.y = height-15;
    }
    if(side == left)
    {
      pos.y = mouseY-35;
      pos.x = 5;
    }
    if(side == right)
    {
      pos.y = mouseY-35;
      pos.x = width -15; 
    }
      
  }
  
  void applyTo(Ball ball)
  {
    ball.theta += -speed;
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    stroke(c);
    fill(c);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    if(side == left || side == right)
    {
      rect(pos.x, pos.y, 10,70);
    }
    if(side == up || side == down)
    {
      rect(pos.x, pos.y, 70,10);
    }
    popMatrix();
  }
}