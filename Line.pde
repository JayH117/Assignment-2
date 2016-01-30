class Line extends GameObject
{
  char up;
  char down;
  char left;
  char right;
  
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
    this.c = c;
  }
  
  void update()
  {
    if(pos.x == 0 || pos.x == width)
    {
      pos.y = mouseY;
    }
    
    if(pos.y == 0 || pos.y == width)
    {
      pos.x = mouseX;
    }
    
    if (pos.x < 0)
    {
      pos.x = width;
    }
    
    if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
      
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    stroke(c);
    fill(c);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    rect(pos.x, pos.y, 70,10);
    popMatrix();
  }
}