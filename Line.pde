class Line extends GameObject
{
  float fpointX = mouseX;
  float fpointY = mouseY;
  float spointX = pmouseX;
  float spointY = pmouseY;
  
  Line()
  {
    super(width * 0.5f, height  * 0.5f, 50);     
  }

  void update()
  {
    if (mousePressed == true) 
    {
      fpointX = mouseX;
      fpointY = mouseY;
      
      if(mousePressed == false)
      {
        spointX = mouseX;
        spointY = mouseY;
      }
      
      line(fpointX, fpointY, spointX, spointY);
      
    }
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    
    popMatrix();
  }
}