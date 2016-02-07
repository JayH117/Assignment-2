class Line extends GameObject
{
  char up;
  char down;
  char left;
  char right;
  char side = up;
  
  Line()
  {
    super(width * 0.5f, height  * 0.5f, 50);     
  }
  
  Line(char up, char down, char left, char right, float startX, float startY, color c)
  {
    super(startX, startY, 50);
    this.up = up;
    this.left = left;
    this.right = right;
    this.down = down;
    this.c = c;
  }
  
  //controlling the line's position
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
      pos.x = mouseX;
      pos.y = 10;
    }
    if(side == down)
    {
      pos.x = mouseX;
      pos.y = height-10;
    }
    if(side == left)
    {
      pos.y = mouseY;
      pos.x = 10;
    }
    if(side == right)
    {
      pos.y = mouseY;
      pos.x = width -10; 
    }
      
  }
  
  void applyTo(Ball ball)
  {
    //controlling rotations
    int i;
    i = (int) random(0,2);
    switch(i)
    {
      case 0:
      {
        ball.theta += random(2,4);
        break;
      }
      case 1:
      {
        ball.theta += random(-2,-4);
        break;
      }
    }
    if (frameCount % 60 == 0)//bug fix
    {
      ball.pos.x = (width/2);
      ball.pos.y = (height/2);
    }
  }
  
  void render()
  {
    pushMatrix();
    stroke(c);
    rectMode(CENTER);
    fill(c);
    //drawing the line on each side
    if(side == left || side == right)
    {
      rect(pos.x, pos.y, 10, 70);
    }
    if(side == up || side == down)
    {
      rect(pos.x, pos.y, 70, 10);
    }
    popMatrix();
  }
}